// IDE-specific rules (VSCode/Cursor/JetBrains/etc.)

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  rules: [
    // Allow Ctrl+Shift+C/V to pass through in VSCode/Cursor so integrated terminals can use them
    k.rule('C (Ctrl+Shift) [Only VSCode/Cursor - passthrough]', k.input('c', ['control', 'shift']), k.outputKey('c', ['control', 'shift']), k.condition('if', ['^com\\.microsoft\\.VSCode$', '^com\\.microsoft\\.VSCodeInsiders$', '^com\\.todesktop\\.230313mzl4w4u92$'])),
    k.rule('V (Ctrl+Shift) [Only VSCode/Cursor - passthrough]', k.input('v', ['control', 'shift']), k.outputKey('v', ['control', 'shift']), k.condition('if', ['^com\\.microsoft\\.VSCode$', '^com\\.microsoft\\.VSCodeInsiders$', '^com\\.todesktop\\.230313mzl4w4u92$'])),

    // Keep most other Ctrl+ mappings as Command for IDE editors
    k.rule('A (Ctrl) [Only IDEs]', k.input('a', ['control']), k.outputKey('a', ['command']), k.condition('if', bundle.ides)),
    k.rule('F (Ctrl) [Only IDEs]', k.input('f', ['control']), k.outputKey('f', ['command']), k.condition('if', bundle.ides)),
    k.rule('N (Ctrl) [Only IDEs]', k.input('n', ['control']), k.outputKey('n', ['command']), k.condition('if', bundle.ides)),
    k.rule('O (Ctrl) [Only IDEs]', k.input('o', ['control']), k.outputKey('o', ['command']), k.condition('if', bundle.ides)),
    k.rule('P (Ctrl) [Only IDEs]', k.input('p', ['control']), k.outputKey('p', ['command']), k.condition('if', bundle.ides)),
    k.rule('R (Ctrl) [Only IDEs]', k.input('r', ['control']), k.outputKey('r', ['command']), k.condition('if', bundle.ides)),
    k.rule('S (Ctrl) [Only IDEs]', k.input('s', ['control']), k.outputKey('s', ['command']), k.condition('if', bundle.ides)),
    k.rule('T (Ctrl) [Only IDEs]', k.input('t', ['control']), k.outputKey('t', ['command']), k.condition('if', bundle.ides)),
    k.rule('U (Ctrl) [Only IDEs]', k.input('u', ['control']), k.outputKey('u', ['command']), k.condition('if', bundle.ides)),
    k.rule('W (Ctrl) [Only IDEs]', k.input('w', ['control']), k.outputKey('w', ['command']), k.condition('if', bundle.ides)),
    k.rule('X (Ctrl) [Only IDEs]', k.input('x', ['control']), k.outputKey('x', ['command']), k.condition('if', bundle.ides)),
    k.rule('Y (Ctrl) [Only IDEs]', k.input('y', ['control']), k.outputKey('y', ['command']), k.condition('if', bundle.ides)),
    k.rule('Z (Ctrl) [Only IDEs]', k.input('z', ['control']), k.outputKey('z', ['command']), k.condition('if', bundle.ides)),

    // Note: We intentionally do NOT remap plain Ctrl+C/V in IDEs here,
    // so integrated terminals still receive SIGINT and raw input.
  ],
}


