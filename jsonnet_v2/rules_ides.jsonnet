// v2 IDE rules (minimal). Ctrl→Cmd assumed globally, so most shortcuts just work

local k = import 'lib/karabiner.libsonnet';
local bundle = import 'lib/bundle.libsonnet';

{
  rules: [
    // Passthrough Ctrl+Shift+C/V for integrated terminals inside VSCode/Cursor
    k.rule('C (Ctrl+Shift) [Only VSCode/Cursor - passthrough]', k.input('c', ['control', 'shift']), k.outputKey('c', ['control', 'shift']), k.condition('if', ['^com\\.microsoft\\.VSCode$', '^com\\.microsoft\\.VSCodeInsiders$', '^com\\.todesktop\\.230313mzl4w4u92$'])),
    k.rule('V (Ctrl+Shift) [Only VSCode/Cursor - passthrough]', k.input('v', ['control', 'shift']), k.outputKey('v', ['control', 'shift']), k.condition('if', ['^com\\.microsoft\\.VSCode$', '^com\\.microsoft\\.VSCodeInsiders$', '^com\\.todesktop\\.230313mzl4w4u92$'])),
  ],
}


 