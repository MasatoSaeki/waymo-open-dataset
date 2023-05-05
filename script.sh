#!/bin/bash

MODEL_NAME=int_pillar

./configure.sh
bazel build waymo_open_dataset/metrics/tools/compute_detection_metrics_main

bazel-bin/waymo_open_dataset/metrics/tools/compute_detection_metrics_main /mnt/$MODEL_NAME/detection_pred.bin /mnt/gt/test/gt_preds.bin
