#!/usr/bin/env python3

########################################################################

# Process files based on date and instrument type.
# For the purpose of filtering, the filename is given
# with the path relative to the input directory.
# This means that subdirectory names are important!
# If subdirectory name contains a name of the instrument,
# all the files inside will be classified as belonging to this instrument.

# The date of the file is encoded in the filename,
# and is assumed to be in one of the formats listed below.
# Warning: the dates are found by pattern matching,
# so it is possible that a filename contains a sequence of digits,
# which is not a date, but which will be interpreted as a date.

# The instrument type is also decoded from the file name.

# Output directory structure is created silently, if needed.
# The script quits if a directory cannot be created.
# The script quits if a file copy fails.

# -h command line option prints help.
# if no -o option is specified, the filtered files are listed

# Logging options:
# 1. no logging
# 2. logging to console with -l option with no argument
# 3. logging to a file with -l log_filename
# 4. logging both to console and to a file using two -l flags, as above

########################################################################


import argparse
import logging
import os
import sys
import shutil
import re
from datetime import datetime, timedelta


# first string is the type indicated in the filename
# it is case insensitive
# second string is the name of the instrument/destination subdirectory
instrument_codes = {
    'adt': 'adt',
    'ice': 'icec',
    'smap': 'smap',
    'SM_OPER_MIR_OSUDP': 'sss',     # smos ???
    'AOD_': 'aod', #IG
    'sst': 'sst'
}



########################################################################

# Create a logger
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)  # Set the global logging level



# Custom action to handle multiple instances of -l
class AppendLogfileAction(argparse.Action):
    def __call__(self, parser, namespace, values, option_string=None):
        if not hasattr(namespace, 'logfiles'):
            setattr(namespace, 'logfiles', [])

        # Check if values is None or starts with '-'
        if values is None or values.startswith('-'):
            # If it's None or starts with '-', assume no logfile provided
            namespace.logfiles.append(None)
        else:
            namespace.logfiles.append(values)



def SetLogging(args):
    # Access the logfiles provided
    if hasattr(args, 'logfiles'):
        # print("Logfiles specified:")
        # print(len(args.logfiles))
        if len(args.logfiles) > 2:
            print("Error: too many -l arguments")
            sys.exit(1)

        # Define a formatter for formatting log messages
        formatter = logging.Formatter('%(asctime)s %(levelname)s: %(message)s', datefmt='%Y-%m-%d %H:%M:%S')

        for logfile in args.logfiles:
            if logfile is None:
                # print("Logging to standard output (No logfile provided)")
                # Create a console handler for outputting log messages to the console
                console_handler = logging.StreamHandler()
                console_handler.setLevel(logging.INFO)  # Set the console logging level

                # Set the formatter for the console handler and add it to logger
                console_handler.setFormatter(formatter)
                logger.addHandler(console_handler)
            else:
                # print(logfile)
                # Create a file handler for writing log messages to a file
                file_handler = logging.FileHandler(logfile)
                file_handler.setLevel(logging.DEBUG)  # Set the file logging level

                # Set the formatter for the file handler and add it to logger
                file_handler.setFormatter(formatter)
                logger.addHandler(file_handler)
    # else:
        # print('No logging, silent operation')



########################################################################




def get_instrument_from_filename(filename):
    for key in instrument_codes:
        if key in filename:
            return instrument_codes[key]
    return None


# case insensitive
def filter_by_instrument(files, instrument_name):
    # print(f"selecting for instrument |{instrument_name}|")
    filtred_files = []
    for file in files:
        if instrument_name.lower() in file.lower():  # (case insensitive)
            filtred_files.append(file)
            # print(f'matching..... |{file}|')
    return filtred_files


########################################################################


def get_file_creation_time(filename):
    stat = os.stat(filename)
    ctime = stat.st_ctime  # Get the file's creation time in Unix timestamp format
    return datetime.fromtimestamp(ctime)  # Convert Unix timestamp to datetime object



def filter_files_created_after(files, given_date):
    filtered_files = []
    for file in files:
        creation_date = get_file_creation_time(file)
        if creation_date > given_date:
            filtered_files.append(file)
    return filtered_files



def beginning_of_day(input_date):
    # Ensure input_date is a datetime object
    if not isinstance(input_date, datetime):
        raise TypeError("Input must be a datetime object")

    # Return a new datetime object with time set to 00:00:00
    return input_date.replace(hour=0, minute=0, second=0, microsecond=0)


# w is the number of hours; it can be negative
def date_24h_window(given_date, w):
    # Ensure given_date is a datetime object
    if not isinstance(given_date, datetime):
        raise TypeError("Input must be a datetime object")

    # Calculate dates
    date_before = given_date + timedelta(hours=w)
    date_after = given_date + timedelta(hours=w+24)

    return date_before, date_after



def is_leap_year(year):
    return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0)

def is_julian_date(year, julian_day):
    return julian_day >= 1 \
        or (is_leap_year(year) and julian_day <= 366) \
        or (not is_leap_year(year) and julian_day <= 365)



def extract_first_date(filename):
    # Define regex patterns for each date format
    patterns = [
        r'(\d{8}T\d{6})',      # YYYYMMDDThhmmss
        r'(\d{14}0)',          # YYYYMMDDHHmmss0
        r'(\d{14})',           # YYYYMMDDHHmmss
        r'(\d{7})'             # YYYYDDD (Julian date)
    ]

    # print(f">>>>>>>>>>>>>>>>>>> {type(filename)} length = {len(filename)}")
    # if isinstance(filename, list):
        # filename = filename[0] 

    # Loop through patterns to find the first valid date
    for pattern in patterns:
        match = re.search(pattern, filename)
        if match:
            date_str = match.group(1)
            # print("date_str = ", date_str)
            # print("len date_str = ", len(date_str))
            try:
                if len(date_str) == 15:
                    if (date_str[8] == 'T'):
                        try:
                            return datetime.strptime(date_str, '%Y%m%dT%H%M%S')
                        except ValueError:
                           continue
                    else:
                        try:
                            return datetime.strptime(date_str, '%Y%m%d%H%M%S0')
                        except ValueError:
                           continue
                elif len(date_str) == 14:   # YYYYMMDDHHmmss
                    try:
                        return datetime.strptime(date_str, '%Y%m%d%H%M%S')
                    except ValueError:
                       continue
                elif len(date_str) == 7:   # YYYYDDD
                    year = int(date_str[:4])
                    julian_day = int(date_str[4:])
                    if not (0 <= year <= 9999):
                        logger.warning(f'In filename {filename}  YYYY = {year} is not a valid year')
                        return None
                    if not is_julian_date(year, julian_day):
                        logger.warning(f'In filename {filename}  YYYY = {year} DDD = {julian_day} is not a valid julian date')
                        return None
                    return datetime(year, 1, 1) + timedelta(days=julian_day - 1)
            except ValueError:
                logger.debug(f'In filename {filename},  >>>>>  {year} {julian_day}')
                logger.warning(f'In filename {filename},  {date_str} is not a recognized date format')
                continue

    # Return None if no valid date is found
    return None



def get_cycle(date_input):
    if not isinstance(date_input, datetime):
        return None

    # Calculate the time of day in UTC
    current_time = date_input.time()

    # Determine the cycle based on UTC time
    if current_time <= datetime.strptime('03:00:00', '%H:%M:%S').time() or current_time > datetime.strptime('21:00:00', '%H:%M:%S').time():
        return "00"
    elif current_time <= datetime.strptime('09:00:00', '%H:%M:%S').time():
        return "06"
    elif current_time <= datetime.strptime('15:00:00', '%H:%M:%S').time():
        return "12"
    else:
        return "18"



def get_cycle_boundaries(date):
    """
    Determine the start and end datetime of the cycle that includes the given datetime.

    Args:
        date (datetime): The datetime for which the cycle boundaries are to be determined.
    
    Returns:
        tuple: A tuple containing the start and end datetime of the cycle.
    """
    # Define cycle boundaries
    cycles = [
        (21, 3),  # 9 PM (previous day) to 3 AM
        (3, 9),   # 3 AM to 9 AM
        (9, 15),  # 9 AM to 3 PM
        (15, 21)  # 3 PM to 9 PM
    ]

    # Extract time from the given date
    hour = date.hour
    minute = date.minute

    # Find the cycle index based on the time
    for i, (start, end) in enumerate(cycles):
        if start <= end:  # For cycles within the same day
            if start <= hour < end or (hour == end and minute == 0):
                cycle_index = i
                break
        else:  # For cycles spanning over midnight
            if hour >= start or hour < end or (hour == end and minute == 0):
                cycle_index = i
                break

    # Calculate the start and end of the cycle
    cycle_start, cycle_end = cycles[cycle_index]

    if cycle_start == 21:  # Special handling for the first cycle (9 PM to 3 AM)
        cycle_start_time = date.replace(hour=21, minute=0, second=0, microsecond=0) - timedelta(days=1)
        cycle_end_time = cycle_start_time + timedelta(hours=6)
    else:
        cycle_start_time = date.replace(hour=cycle_start, minute=0, second=0, microsecond=0)
        cycle_end_time = date.replace(hour=cycle_end, minute=0, second=0, microsecond=0)
        if cycle_end <= cycle_start:  # Handle cycle end crossing midnight
            cycle_end_time += timedelta(days=1)

    return cycle_start_time, cycle_end_time

# Example usage
# input_date_str = '2024-08-22 10:15:00'  # Example input date
# input_date = datetime.strptime(input_date_str, '%Y-%m-%d %H:%M:%S')
# 
# cycle_start, cycle_end = get_cycle_boundaries(input_date)
# print(f"Cycle start: {cycle_start}")
# print(f"Cycle end: {cycle_end}")


########################################################################



def categorize_files_by_cycle(files):
    # Initialize lists for each cycle
    cycle00_files = []
    cycle06_files = []
    cycle12_files = []
    cycle18_files = []
    no_date_files = []

    # print(f"categorize >>>>>>>>>>>>>>>>>>> {type(files)} length = {len(files)}")
    # if isinstance(filename, list):
        # filename = filename[0] 

    for file in files:
        # print(f"categorize file >>>>>>>>>>>>>>>>>>> {type(file)} length = {len(file)}")
        # print(f"categorize file[0] >>>>>>>>>>>>>>>>>>> {type(file[0])} length = {len(file[0])}")
        file_date = extract_first_date(file)

        # Determine cycle based on date
        if file_date is None:
            no_date_files.append(file)
        else:
            file_cycle = get_cycle(file_date)
            if file_cycle == "00":
                cycle00_files.append(file)
            elif file_cycle == "06":
                cycle06_files.append(file)
            elif file_cycle == "12":
                cycle12_files.append(file)
            elif file_cycle == "18":
                cycle18_files.append(file)

    if len(no_date_files) > 0:
        logger.warning(f"Did not find date in {len(no_date_files)} files.")
    # logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    # logger.debug(f"{no_date_files}")
    # logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")

    return cycle00_files, cycle06_files, cycle12_files, cycle18_files, no_date_files



# strictly before end date
def filter_files_by_date(files, start_date, end_date):
    logger.debug(f"Filtering files between {start_date} and {end_date}")
# logger.debug(f"Filtering files between {cycle_start_date} and {cycle_end_date}}")

    # Ensure start_date and end_date are datetime objects
    if not isinstance(start_date, datetime) or not isinstance(end_date, datetime):
        raise TypeError("Both start_date and end_date must be datetime objects")

    filtered_files = []
    for file in files:
        file_date = extract_first_date(file) 
        if file_date and start_date <= file_date < end_date:
            filtered_files.append(file)

    return filtered_files


########################################################################


def get_dir_files(input_dir):
    if not os.path.exists(input_dir):
        logger.error(f"Error: Input directory '{input_dir}' does not exist.")
        return []
    return os.listdir(input_dir)



def list_files_in_subdirectories(directory):
    # Validate directory existence
    if not os.path.isdir(directory):
        raise ValueError(f"{directory} is not a valid directory")

    files_list = []

    # Iterate over subdirectories
    for subdirectory in os.listdir(directory):
        subdirectory_path = os.path.join(directory, subdirectory)
        if os.path.isdir(subdirectory_path):
            # List files in the subdirectory (not recursive)
            subdirectory_files = [f for f in os.listdir(subdirectory_path) if os.path.isfile(os.path.join(subdirectory_path, f))]
            # Add subdirectory path to each file and extend files_list
            files_list.extend([os.path.join(subdirectory_path, f) for f in subdirectory_files])

    return files_list



def list_files_recursive_absolute_path(directory):
    file_list = []
    # Walk through the directory recursively
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            if os.path.isfile(file_path):  # Check if it's a file
                file_list.append(file_path)
    return file_list



def list_files_recursive_relative_path(directory):
    files_list = []
    for root, _, files in os.walk(directory):
        for file in files:
            # Get the full path of the file
            file_path = os.path.join(root, file)
            # Get the relative path of the file from the directory
            relative_path = os.path.relpath(file_path, directory)
            files_list.append(relative_path)
    return files_list



def set_absolute_path(directory, files):
    absolute_paths = []
    for file in files:
        # Join the directory path with the file (relative path)
        absolute_path = os.path.join(directory, file)
        # Normalize the path (optional) to handle any inconsistencies
        absolute_path = os.path.normpath(absolute_path)
        absolute_paths.append(absolute_path)
    return absolute_paths



def copy_files(files_to_copy, output_dir):
    if not os.path.exists(output_dir):
        # os.makedirs(output_dir)
        logger.error(f"Error: Output directory '{output_dir}' does not exist.")
        return

    for file in files_to_copy:
        try:
            shutil.copy(file, output_dir)
            logger.info(f'Copied {os.path.basename(file)} to {output_dir}')
        except Exception as e:
            logger.error(f"Error: Failed to copy file '{os.path.basename(file)}'. Reason: {str(e)}")
            # Exit immediately when the first copy fails
            sys.exit(1)




def print_file_names(files):
    for file in files:
        print(file)



def copy_cycle_files(cycle_files, output_dir_path, cycle):
    logger.debug(f"Copying {len(cycle_files)} files for cycle {cycle}.")
    dir_path = os.path.join(output_dir_path, cycle)
    dir_path = os.path.join(dir_path, "ocean")

    for key, value in instrument_codes.items():
        instrument_dir_path = os.path.join(dir_path, value)
        instrument_files = filter_by_instrument(cycle_files, key)
        logger.debug(f"Copying {len(instrument_files)} files for cycle {cycle} for instrument {key}.")
        copy_files(instrument_files, instrument_dir_path)



def mkdir(dir_path):
    try:
        os.makedirs(dir_path, exist_ok=True)
        logger.info(f"Created directory '{dir_path}'")
    except OSError as e:
        logger.error(f"Error creating directory '{dir_path}': {e}")
        sys.exit(1)



# no error if the directory exists already
def make_cycle_dir_structure(root_dir, cycle):
    dir_path = os.path.join(root_dir, cycle)
    mkdir(dir_path)

    dir_path = os.path.join(dir_path, "ocean")
    mkdir(dir_path)

    for key, value in instrument_codes.items():
        subdir_path = os.path.join(dir_path, value)
        mkdir(subdir_path)
 


def make_dir_structure(root_dir):
    if not os.path.exists(root_dir):
        logger.info(f"Creating a directory structure in {root_dir}")
        mkdir(root_dir)
    make_cycle_dir_structure(root_dir, "00")
    make_cycle_dir_structure(root_dir, "06")
    make_cycle_dir_structure(root_dir, "12")
    make_cycle_dir_structure(root_dir, "18")


########################################################################


def main():
    # Parse command-line arguments
    parser = argparse.ArgumentParser(description='Copy selected files from input directory to output directory')


    parser.add_argument('-i', '--input-dir', type=str, required=True, help='Input directory path')
    parser.add_argument('-o', '--output-dir', type=str, required=False, help='Output directory path')
    parser.add_argument('-I', '--instrument-name', type=str, required=False, help='Select files that match the instrument name')
    # Add the -l argument with custom action
    parser.add_argument('-l', '--logfile', 
                    action=AppendLogfileAction, 
                    nargs='?', const=None, metavar='LOGFILE',
                    help='Specify a logfile. Empty name stands for standard output.')
    parser.add_argument('-d', '--reference-date', type=str, required=False,
                        help='Reference date for filtering files (format: YYYYMMDD_HHMM)')


    # parser.add_argument('-l', '--log-filename', metavar='LOG_FILENAME', nargs='?', const=None, help='Name of the log file. Empty name stands for standard output.')
    # parser.add_argument('-s', '--search-string', type=str, required=True,
                        # help='String to search for in filenames (case insensitive)')





    args = parser.parse_args()

    SetLogging(args)

    command_line = ' '.join(sys.argv)
    logger.info(f"Executing {command_line}")

    try:
        reference_date = datetime.strptime(args.reference_date, '%Y%m%d_%H%M')
    except ValueError:
        print("no reference date YYYYMMDD_HHMM.")
        print("Error: Invalid reference date format. Please use YYYYMMDD_HHMM.")
        logger.error("Invalid reference date format. Please use YYYYMMDD_HHMM.")
        # return

    # print(f"reference_date = {reference_date}")
    # sys.exit(1)


    input_dir_path = args.input_dir
    # input_dir_path = '/scratch1/NCEPDEV/da/Iliana.Genkova/test_dcom'
    # input_dir_path = '/scratch1/NCEPDEV/da/Iliana.Genkova/test_dcom/20240710'

    output_dir_path = args.output_dir
    # output_dir_path = "jc2"
    # output_dir_path = '/scratch1/NCEPDEV/da/Edward.Givelberg/junk'
    if output_dir_path:
        logger.debug(f"Copying files from {input_dir_path} to {output_dir_path}.")


    instrument_name = args.instrument_name
    # instrument_name = "sst"

############################################################################

    logger.debug(f"Preparing a list of files.")
    # files = get_dir_files(input_dir_path)
    # files = list_files_in_subdirectories(input_dir_path)
    # files = list_files_recursive_relative_path(input_dir_path)
    files = []
    for dir in input_dir_path:
        dir_files = list_files_recursive_relative_path(input_dir_path)
        # files.append(dir_files)
        files.extend(dir_files)

    # print(f"files >>>>>>>>>>>>>>>>>>> {type(files)} length = {len(files)}")
    # print(f"files[0] >>>>>>>>>>>>>>>>>>> {type(files[0])} length = {len(files[0])}")


    logger.debug(f"Selected {len(files)} files.")
    # logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    # logger.debug(f"{files}")
    # logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")


############################################################################
# filter files

    if (instrument_name):
        logger.debug(f"Filtering files for instrument {instrument_name}")
        files = filter_by_instrument(files, instrument_name)
        logger.debug(f"Selected {len(files)} files.")

    if reference_date:
        # print(f"uuuuuuuuuuuureference_date = {reference_date}")
        logger.debug(f"Filtering files for cycle {reference_date}")
        cycle_start_date, cycle_end_date = get_cycle_boundaries(reference_date)
        files = filter_files_by_date(files, cycle_start_date, cycle_end_date)
        logger.debug(f"Selected {len(files)} files.")
        # print(f"uuuuuuuuuuuureference_date = {reference_date}")

    # sys.exit(1)

    # no exception is raised if the directory structure already exists
    # missing subdirectories are created, as needed
    if (output_dir_path):
        logger.debug(f"Preparing the output directory structure in {output_dir_path}")
        make_dir_structure(output_dir_path)

        logger.debug(f"Sorting the file list by cycles.")
        cycle00, cycle06, cycle12, cycle18, no_date = categorize_files_by_cycle(files)
        # print("Files categorized by cycle:")
        # print(f"Cycle 00: {cycle00}")
        # print(f"Cycle 06: {cycle06}")
        # print(f"Cycle 12: {cycle12}")
        # print(f"Cycle 18: {cycle18}")
        # print(f"No date found: {no_date}")

        cycle00 = set_absolute_path(input_dir_path, cycle00)
        cycle06 = set_absolute_path(input_dir_path, cycle06)
        cycle12 = set_absolute_path(input_dir_path, cycle12)
        cycle18 = set_absolute_path(input_dir_path, cycle18)

        copy_cycle_files(cycle00, output_dir_path, '00')
        copy_cycle_files(cycle06, output_dir_path, '06')
        copy_cycle_files(cycle12, output_dir_path, '12')
        copy_cycle_files(cycle18, output_dir_path, '18')

    else:
        print_file_names(files)



    # for file in files:
        # print("file = ", file)
        # # print("instrument = ", extract_instrument_code(file))
        # print("instrument = ", get_instrument_from_filename(file))
        # date = extract_first_date(file)
        # print("date = ", date)
        # print("cycle = ", get_cycle(date))

    # input_date = datetime(2024, 6, 23, 12, 0, 0)  # Example datetime input
    # start_date, end_date = date_24h_window(input_date, -3)
    # print(f"Given date: {input_date}")
    # print(f"from: {start_date}")
    # print(f"to: {end_date}")

    # files = filter_files_by_date(files, start_date, end_date)

    # copy_files(files, args.output_dir)



if __name__ == '__main__':
    main()


# logger.debug('This is a debug message')
# logger.info('This is an info message')
# logger.warning('This is a warning message')
# logger.error('This is an error message')
# logger.critical('This is a critical message')
