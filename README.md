
## 🞂 [2-projecttitle-page-count-override.lua](https://github.com/igarizio/KOReader.patches/blob/main/2-projecttitle-page-count-override.lua)
This patch makes "Project: Title" use the page counts from the reader. This is useful if you don't want to set page counts on Calibre. This will work for any file **as long as it has been opened at least once**. Keep in mind that this means page counts will vary depending on your reader settings.

I also left a snippet to edit the progress bar length (which you will probably want to adjust). Change this line: `ptutil.list_defaults.progress_bar_pages_per_pixel`.

The idea comes from this PR: https://github.com/joshuacant/ProjectTitle/pull/149.
