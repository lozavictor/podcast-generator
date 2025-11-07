# 🎧 Podcast Feed Generator

A **GitHub Action** that generates a valid podcast RSS feed (`podcast.xml`) from a simple YAML file.  
YAML is much easier to read and maintain than XML, and this Action automatically converts your YAML metadata into a properly formatted podcast feed — ready to be hosted or submitted to podcast directories.

---

## 🚀 Usage

### 1. Turn on GitHub Pages
To make your podcast feed publicly accessible, you can use GitHub Pages:

1. Go to your repository’s **Settings → Pages**.  
2. Select the **main branch** as the source.  
3. Save your settings — GitHub will give you a public URL (note it down; you’ll use it as the `link` in your YAML file).

---

### 2. Create a YAML File

In your repository, create a file named `feed.yaml` with the following format:

```yaml
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language, e.g. en-us>
category: <Podcast Category, e.g. Technology>
format: <File Format, e.g. audio/mpeg>

item:
  - title: <Episode Title>
    description: <Episode Description>
    published: <Date Published, e.g. Thu, 12 Jan 2023 18:00:00 GMT>
    file: <Audio File Path, e.g. /audio/episode1.mp3>
    duration: <Duration, e.g. 00:10:36>
    length: <File Size in Bytes, e.g. 524288>
```

Repeat the `item` section for each episode you want to include in your feed.

---

### 3. Add a Workflow File

You’ll need a workflow to run this Action automatically whenever your YAML file changes.  
In your repository, create a workflow file at:

```
.github/workflows/main.yml
```

Add the following content:

```yaml
name: Generate Podcast Feed
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3

      - name: Run Feed Generator
        uses: lozavictor/podcast-generator@main
```

When you push any update to your repository (for example, when you change `feed.yaml`),  
this workflow will automatically generate a new `podcast.xml` file based on your YAML data.

---

## 🧾 Output

After the workflow completes successfully, you’ll see a new file named:

```
podcast.xml
```

This is your **podcast RSS feed**.  
You can host it on GitHub Pages or use the public link directly when submitting your podcast to platforms like **Apple Podcasts**, **Spotify**, or **Pocket Casts**.

---

## 🐳 How It Works

- The Action runs inside a **Docker container** defined by the included `Dockerfile`.  
- Inside that container, `feed.py` reads your YAML data and builds a valid XML feed.  
- The Action can be reused across any repository by referencing it as:
  ```yaml
  uses: lozavictor/podcast-generator@main
  ```

---

## 📦 Example Project

See an example usage in:  
👉 [lozavictor/podcast-test](https://github.com/lozavictor/podcast-test)

That repository demonstrates:
- The sample `feed.yaml` structure
- The workflow configuration
- The generated `podcast.xml` output

---

## 🧠 Summary

With this Action, you can automate podcast feed generation entirely within GitHub —  
no manual XML editing or extra software required.  
Simply write your podcast details in YAML, push your changes, and your feed updates automatically.
