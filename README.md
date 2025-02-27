## Installation

1. Agree to the Natural Scenes Dataset's [Terms and Conditions](https://cvnlab.slite.page/p/IB6BSeW_7o/Terms-and-Conditions) and fill out the [NSD Data Access form](https://forms.gle/xue2bCdM9LaFNMeb7)
2. Create a conda environment and install the packages necessary to run the code.

```bash
conda create -n recon python=3.10.8 -y
conda activate recon
pip install -r requirements.txt
```

## Preparation

### Data

Download the essential files we used from [NSD dataset](https://natural-scenes-dataset.s3.amazonaws.com/index.html), which contains `nsd_stim_info_merged.csv`, `captions_train2017.json` and `captions_val2017.json`.
We use the same preprocessed data as [MindEye's](https://github.com/MedARC-AI/fMRI-reconstruction-NSD), which can be downloaded from [Hugging Face](https://huggingface.co/datasets/pscotti/naturalscenesdataset/tree/main/webdataset_avg_split), and extract all files from the compressed tar files.
Then organize the data as following:

<details>

<summary>Data Organization</summary>

```
data/natural-scenes-dataset
├── nsddata
│   └── experiments
│       └── nsd
│           └── nsd_stim_info_merged.csv
├── nsddata_stimuli
│   └── stimuli
│       └── nsd
│           └── annotations
│              ├── captions_train2017.json
│              └── captions_val2017.json
└── webdataset_avg_split
    ├── test
    │   ├── subj01
    │   │   ├── sample000000349.coco73k.npy
    │   │   ├── sample000000349.jpg
    │   │   ├── sample000000349.nsdgeneral.npy
    │   │   └── ...
    │   └── ...
    ├── train
    │   ├── subj01
    │   │   ├── sample000000300.coco73k.npy
    │   │   ├── sample000000300.jpg
    │   │   ├── sample000000300.nsdgeneral.npy
    │   │   └── ...
    │   └── ...
    └── val
        ├── subj01
        │   ├── sample000000000.coco73k.npy
        │   ├── sample000000000.jpg
        │   ├── sample000000000.nsdgeneral.npy
        │   └── ...
        └── ...
```

</details>

## Training on specific-subject

```bash
bash scripts/train_specific_subject.sh
```

## Training on cross-subjects

```bash
bash scripts/train_cross_subject.sh
```

## Reconstructing and evaluating

```bash
bash scripts/inference.sh
```

