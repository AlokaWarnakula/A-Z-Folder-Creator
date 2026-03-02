# 🐇 A-Z Folder Creator

> *"The best hiding spot is the one nobody has the patience to find."*

---

```
F:\
 └── A\
      └── A\
           └── A\
                └── A\
                     └── A\
                          └── your_totally_normal_file.txt  👀
```

**A simple Windows CMD script that creates a labyrinth of alphabetically nested folders.**  
Because sometimes you need 11,881,376 folders and a questionable life choice.

---

## 🤔 Why Does This Exist?

Great question. Here's a totally believable list of legitimate use cases:

- 📁 **"Organized file archiving"** *(sure)*
- 🗂️ **"Testing filesystem performance"** *(classic)*
- 🔬 **"Research purposes"* *(the most suspicious one)*
- 🐇 **Burying one file so deep inside a rabbit hole that even YOU forget where it is**
- 😤 Passive-aggressively responding to a coworker who keeps snooping your PC
- 🧠 Proving to yourself that A\A\A\A\A\A is a valid filing system

Nobody is judging you. The script doesn't ask questions. Neither do we.

---

## ✨ Features

- 🗺️ **Custom location** — any drive, any path
- 🔢 **First-level count** — 1 folder (just `A`) up to 26 (`A` through `Z`)
- 📂 **Inner folder count** — separate A-Z range for sub-folders
- 🕳️ **Depth control** — up to 5 levels of pure rabbit hole
- 📊 **Folder count + MB estimate** before you commit to the chaos
- ✅ **Confirmation screen** — one last chance to reconsider your life

---

## 🚀 Usage

**Step 1.** Download `AZ_FolderCreator.cmd`

**Step 2.** Double-click it. A black window appears. This is normal. You're fine.

**Step 3.** Answer 4 questions:

```
STEP 1 → Where? (e.g. F:\ or D:\MyFiles)
STEP 2 → How many folders on the first level? (1–26)
STEP 3 → How many folders inside each folder? (1–26)
STEP 4 → How many levels deep? (1–5)
```

**Step 4.** Review the summary. Stare at the folder count. Question your choices.

**Step 5.** Press `Y`. Watch Windows work harder than it has in years.

---

## 🧮 Math You Didn't Ask For

With **26 first-level** folders, **26 inner** folders, and **5 levels** deep:

```
26 + 26² + 26³ + 26⁴ + 26⁵ = 12,356,630 folders
```

That's **~47 GB** of empty folders.  
For context, the entire Lord of the Rings trilogy is 6 GB.  
You are creating **7.8x the Lord of the Rings** in empty folders.

Please use this power responsibly.

---

## 📸 Example

```
First level  = 2  (A, B)
Inner count  = 2  (A, B inside each)
Depth        = 3  levels total

Result:
  root\A
  root\A\A
  root\A\A\A
  root\A\A\B
  root\A\B
  root\A\B\A
  root\A\B\B
  root\B
  root\B\A
  root\B\A\A
  root\B\A\B
  root\B\B
  root\B\B\A
  root\B\B\B

14 folders. Perfectly reasonable.
```

---

## ⚠️ Warnings

| Situation | Advice |
|-----------|--------|
| You chose 26 letters × 5 levels | May your SSD rest in peace |
| Windows says "path too long" | You went too deep. You knew the risks. |
| You forgot which folder you hid something in | This is on you |
| Your IT department asks questions | You were "testing filesystem performance" |
| You actually need to DELETE all these folders | `rmdir /s /q "your_path"` — godspeed |

---

## 🗑️ How to Delete Everything

```bat
rmdir /s /q "F:\YourFolderPath"
```

One command. Instant regret reversal. We gotchu.

---

## 🛠️ Requirements

- Windows (XP and above, probably)
- CMD (comes free with every Windows since 1987)
- A drive with enough space for your ambitions
- Absolutely nothing else

No Python. No Node. No dependencies. No dignity required.

---

## 🤝 Contributing

Found a bug? Want more levels? Think 26 letters isn't enough and we should support Unicode folder names going 10 levels deep?

Open an issue. We'll talk.

---

## 📜 License

MIT — do whatever you want with it.  
Hide it in a folder. We won't be able to find it anyway.

---

<div align="center">

**Made with 🖤 and an unhealthy obsession with nested directories**

*If this repo helped you hide something,  
please don't tell us what it was.*

⭐ Star this repo if you've ever created more folders than you have files

</div>
