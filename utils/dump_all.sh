#!/bin/bash

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.h*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.i*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.m*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.o*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.p*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.r*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.s*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.t*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.u*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.v*.tm00.bufr_d; do
    debufr $i
done

for i in /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.v*.tm00.bufr_d; do
    debufr $i
done

debufr /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.prepbufr

debufr /lfs/h1/ops/prod/com/obsproc/v1.0/gdas.20221021/00/atmos/gdas.t00z.nsstbufr
