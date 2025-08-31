// v2 terminal rules independent of Ctrl→Cmd swap; robust ESC/readline mapping

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  rules: [
    // Copy/Paste: Ctrl+Shift like Linux terminals
    k.rule('V (Ctrl+Shift) [Only Terminal Emulators]', k.input('v', ['control', 'shift']), k.outputKey('v', ['command']), k.condition('if', bundle.terminalEmulators)),
    k.rule('C (Ctrl+Shift) [Only Terminal Emulators]', k.input('c', ['control', 'shift']), k.outputKey('c', ['command']), k.condition('if', bundle.terminalEmulators)),

    // Line traversal with Cmd
    k.rule('Left Arrow (Cmd) [Only Terminal Emulators]', k.input('left_arrow', ['command']), k.outputKey('a', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Right Arrow (Cmd) [Only Terminal Emulators]', k.input('right_arrow', ['command']), k.outputKey('e', ['control']), k.condition('if', bundle.terminalEmulators)),

    // Word traversal with Ctrl using ESC sequences
    k.rule('Left Arrow (Ctrl) [Only Terminal Emulators]', k.input('left_arrow', ['control']), [k.outputKey('escape'), k.outputKey('b')], k.condition('if', bundle.terminalEmulators)),
    k.rule('Right Arrow (Ctrl) [Only Terminal Emulators]', k.input('right_arrow', ['control']), [k.outputKey('escape'), k.outputKey('f')], k.condition('if', bundle.terminalEmulators)),

    // Deletion: line and word
    k.rule('Backspace (Cmd) [Only Terminal Emulators]', k.input('delete_or_backspace', ['command']), k.outputKey('u', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Delete (Cmd) [Only Terminal Emulators]', k.input('delete_forward', ['command']), k.outputKey('k', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Backspace (Ctrl) [Only Terminal Emulators]', k.input('delete_or_backspace', ['control']), k.outputKey('w', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Delete (Ctrl) [Only Terminal Emulators]', k.input('delete_forward', ['control']), [k.outputKey('escape'), k.outputKey('d')], k.condition('if', bundle.terminalEmulators)),
  ],
}


