# PromPrune

Official repository for "Balancing Saliency and Coverage: Semantic Prominence-Aware Budgeting for Visual Token Compression in VLMs."

<a href="https://github.com/jayaylee">Author Name</a><sup>&ast;</sup>, <a href="https://github.com/jayaylee">Author Name</a><sup>&ast;</sup>, <a href="https://github.com/jayaylee">Author Name</a><sup>&dagger;</sup>

<sup>&ast;</sup>Equal contribution, <sup>&dagger;</sup>Corresponding author

[**🌐 Project Page**](https://github.com/jayaylee/PromPrune) | [**📄 Paper**](https://arxiv.org/)

## 🎉 News

- **[2026/03]** Initial repository scaffold is live.
- More updates coming soon.

## 📖 Overview

Large Vision-Language Models (LVLMs) incur substantial computational cost when processing long visual token sequences. PromPrune is a visual token compression framework that aims to balance two complementary goals:

1. Preserving semantically prominent local evidence.
2. Retaining globally diverse visual coverage under a limited token budget.

Our current implementation focuses on a simple and practical two-stage pruning strategy:

- Stage 1: saliency-driven token selection using CLS attention.
- Stage 2: diversity-driven token selection using DPP-style subset construction.
- Adaptive budgeting: dynamic budget allocation between the two stages based on image-level feature statistics.

This repository is being organized to support controlled evaluation of PromPrune on top of LLaVA-style models and `lmms-eval`.

## 🔍 Key Ideas

PromPrune is built around the following working hypotheses:

1. Images with concentrated evidence benefit more from local saliency-focused pruning.
2. Images with distributed or complex evidence require broader token coverage.
3. A fixed split between saliency and diversity is suboptimal across images.
4. Adaptive budget allocation can better trade off local importance and global coverage.

The current codebase includes:

- A PromPrune-style `encode_images_promprune` path inside the local `llava` implementation.
- Dynamic stage budget allocation using spectral-entropy-based statistics.
- Stage-1 attention top-k token selection.
- Stage-2 diversity selection with DPP-style greedy subset construction.
- `lmms-eval` integration for evaluating local LLaVA-based PromPrune variants.

## 💻 Code

The repository currently contains an experimental implementation of PromPrune integrated into:

- [`llava/`](/home/jhoonlee/workspace/PromPrune/llava)
- [`lmms-eval/`](/home/jhoonlee/workspace/PromPrune/lmms-eval)
- [`scripts/`](/home/jhoonlee/workspace/PromPrune/scripts)

Example evaluation entrypoint:

```bash
./scripts/lmms_eval_llava15_local.sh
```

You can override PromPrune hyperparameters at runtime:

```bash
VISUAL_TOKEN_NUM=64 \
PROMPRUNE_KR_MIN=0.1 \
PROMPRUNE_KR_MAX=0.7 \
PROMPRUNE_MU=0.42 \
PROMPRUNE_TAU=0.02 \
./scripts/lmms_eval_llava15_local.sh --tasks mme
```

Additional setup instructions, pretrained checkpoints, and benchmark commands will be refined incrementally.

## 🗂️ Repository Status

This README is currently a scaffold adapted from the intended paper/project layout. We will update the following sections over time:

- Author list and affiliations
- Project page and paper links
- Benchmark tables and main results
- Setup and reproduction instructions
- Ablation details and visualizations

## 📧 Contact

For questions or collaboration, please open an issue:

- [PromPrune Issues](https://github.com/jayaylee/PromPrune/issues)

## 🙏 Acknowledgements

We thank the open-source communities around:

- [LLaVA](https://github.com/haotian-liu/LLaVA)
- [lmms-eval](https://github.com/EvolvingLMMs-Lab/lmms-eval)

Their codebases provide the foundation for our current experimental implementation and evaluation pipeline.

## 📜 License

This project is licensed under the Apache License 2.0.
