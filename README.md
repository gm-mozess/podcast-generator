
# 🎧 Podcast Generator

A GitHub Action to generate a podcast RSS feed from a human-friendly YAML file. YAML is easier to read and write than XML, making podcast publishing simple and efficient.

---

## 📘 How to Use

### 🔹 Step 1: Enable GitHub Pages

To make your podcast feed publicly accessible:

1. Go to your repository’s **Settings > Pages**.
2. Under **Source**, choose the `main` branch.
3. Save and note the generated GitHub Pages URL — you’ll use this in your feed YAML file.

---

### 🔹 Step 2: Create a YAML File

Create a file named `feed.yaml` at the root of your repository with the following structure:

```yaml
title: My Podcast
subtitle: Insightful tech talks
author: Jane Doe
description: A podcast exploring the latest in software, hardware, and tech culture.
link: https://<your-username>.github.io/<your-repo>
image: /images/artwork.jpg
language: en-us
category: Technology
format: audio/mpeg

item:
  - title: Episode 1 - The Future of AI
    description: A deep dive into generative AI and its applications.
    published: Thu, 12 Jan 2023 18:00:00 GMT
    file: /audio/episode1.mp3
    duration: 00:10:25
    length: 10485760
  - title: Episode 2 - The Rise of Rust
    description: Why Rust is taking over systems programming.
    published: Thu, 19 Jan 2023 18:00:00 GMT
    file: /audio/episode2.mp3
    duration: 00:12:40
    length: 12582912
```

💡 **Tip:** Use `stat` or your OS's file info panel to determine the file `length` in bytes.

---

### 🔹 Step 3: Add GitHub Actions Workflow

Add the following workflow to `.github/workflows/generate-feed.yml`:

```yaml
name: Generate Podcast Feed

on: [push]

jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Run Podcast Feed Generator
        uses: planetoftheweb/podcast-feed-generator@main
```

Each time you push changes to the repository, this workflow will automatically convert your `feed.yaml` into a valid `feed.xml` RSS podcast feed.

---

## 🌐 Accessing Your Feed

After deployment, your podcast feed will be publicly available at:

```
https://<your-username>.github.io/<your-repo>/feed.xml
```

You can submit this URL to podcast platforms like Apple Podcasts, Spotify, and others.

---

## 📄 License

This project is licensed under the MIT License — you're free to fork, adapt, and share it.
