# Obsidian Commands Cheat Sheet

## Insert Text
- `#` - Create a new TODO or heading
- `$` - Insert Raw Text (no formatting)
- `{ }` - Use a Placeholder (e.g., {username})

## Linking and Embedding
- `[link text](@/path/to/file.ext)` - Place an inline link to the current vault.
- `[My File.md](/@file/path/to/my-file.ext)` - Insert an absolute inline link.

## Editing Notes
- `{{my note content}}` - Insert a Note block. 
- `\{begin-note\}\* text content \{\end-note\}` - Manual note insertion for older obsidian versions.
  
## Deleting/Formatting Notes / Comments
- `\n\n--\n--\n` - Toggle a comment in the current line, adding an em-dash at the cursor.
- `|text|\n{{my note here}}|\n||text||` - Insert two lines and add a blank Note block between them.

## Organizing/Searching
- `{{query@/}}` - Run a query directly from command bar (e.g., {{todo task1}})
- `\#query\@/all` - Find all matches for the current todo or heading in the vault.
  
## Snippets
- `### snippet.md ###`
  - Create a new markdown document with the same name inside a `snippets` folder.

## Exporting Data
- `%{{todo}}%` to get only TODO items.

---

- Official Documentation: [https://obsid.io/docs/](https://obsid.io/docs/)
