#!/usr/bin/env bash
# Regenerate manifest.json from subfolders in the covers directory.
# Run after adding/removing cover images or categories.

cd "$(dirname "$0")/../covers"

python3 -c "
import os, json
manifest = {}
for d in sorted(os.listdir('.')):
    if os.path.isdir(d) and not d.startswith('.'):
        files = sorted([f for f in os.listdir(d) if not f.startswith('.') and f.lower().endswith(('.jpg','.jpeg','.png','.gif','.webp'))])
        manifest[d] = files
with open('manifest.json', 'w') as f:
    json.dump(manifest, f, indent=2)
"

echo "manifest.json updated"
