#!/bin/bash

MODEL_PATH="${MODEL_PATH:-liuhaotian/llava-v1.5-7b}"
TASKS="${TASKS:-mme}"
BATCH_SIZE="${BATCH_SIZE:-1}"
OUTPUT_PATH="${OUTPUT_PATH:-logs/promprune_llava15_vtc/}"
LOG_SAMPLES_SUFFIX="${LOG_SAMPLES_SUFFIX:-promprune_llava15_vtc}"
VISUAL_TOKEN_NUM="${VISUAL_TOKEN_NUM:-128}"
PROMPRUNE_KR_MIN="${PROMPRUNE_KR_MIN:-0.}"
PROMPRUNE_KR_MAX="${PROMPRUNE_KR_MAX:-1.0}"
PROMPRUNE_MU="${PROMPRUNE_MU:-0.42}"
PROMPRUNE_TAU="${PROMPRUNE_TAU:-0.02}"

MODEL_ARGS="pretrained=${MODEL_PATH},conv_template=vicuna_v1,device_map=auto,visual_token_num=${VISUAL_TOKEN_NUM},promprune_kr_min=${PROMPRUNE_KR_MIN},promprune_kr_max=${PROMPRUNE_KR_MAX},promprune_mu=${PROMPRUNE_MU},promprune_tau=${PROMPRUNE_TAU}"

python -m lmms_eval \
  --model llava \
  --model_args "${MODEL_ARGS}" \
  --tasks "${TASKS}" \
  --batch_size "${BATCH_SIZE}" \
  --log_samples \
  --log_samples_suffix "${LOG_SAMPLES_SUFFIX}" \
  --output_path "${OUTPUT_PATH}" \
  "$@"
