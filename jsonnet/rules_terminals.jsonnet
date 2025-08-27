// Terminal-specific rules: only apply to terminal emulators

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  rules: [
    // Copy/Paste use Ctrl+Shift like Linux terminals
    k.rule('C (Ctrl+Shift) [Only Terminal Emulators]', k.input('c', ['control', 'shift']), k.outputKey('c', ['command']), k.condition('if', bundle.terminalEmulators)),
    k.rule('V (Ctrl+Shift) [Only Terminal Emulators]', k.input('v', ['control', 'shift']), k.outputKey('v', ['command']), k.condition('if', bundle.terminalEmulators)),

    // Navigation: line traversal with Cmd; word traversal with Ctrl
    k.rule('Left Arrow (Cmd) [Only Terminal Emulators]', k.input('left_arrow', ['command']), k.outputKey('a', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Right Arrow (Cmd) [Only Terminal Emulators]', k.input('right_arrow', ['command']), k.outputKey('e', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Left Arrow (Ctrl) [Only Terminal Emulators]', k.input('left_arrow', ['control']), k.outputKey('left_arrow', ['option']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Right Arrow (Ctrl) [Only Terminal Emulators]', k.input('right_arrow', ['control']), k.outputKey('right_arrow', ['option']), k.condition('if', bundle.terminalEmulators)),

    // Deletion: line and word
    k.rule('Backspace (Cmd) [Only Terminal Emulators]', k.input('delete_or_backspace', ['command']), k.outputKey('u', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Delete (Cmd) [Only Terminal Emulators]', k.input('delete_forward', ['command']), k.outputKey('k', ['control']), k.condition('if', bundle.terminalEmulators)),
    // Use Ctrl+W for backward word delete, and ESC d for forward word delete to avoid Option-as-Meta issues
    k.rule('Backspace (Ctrl) [Only Terminal Emulators]', k.input('delete_or_backspace', ['control']), k.outputKey('w', ['control']), k.condition('if', bundle.terminalEmulators)),
    k.rule('Delete (Ctrl) [Only Terminal Emulators]', k.input('delete_forward', ['control']), [k.outputKey('escape'), k.outputKey('d')], k.condition('if', bundle.terminalEmulators)),

    // Keep traditional Ctrl+C/D behavior by not remapping plain Ctrl+C here.
    // Add common extras
    k.rule('/ (Ctrl) [+Terminal Emulators]', k.input('slash', ['control']), k.outputKey('slash', ['command']), k.condition('if', bundle.terminalEmulators)),
    k.rule('F4 (Alt) [+Terminal Emulators]', k.input('f4', ['option']), k.outputKey('q', ['command']), k.condition('if', bundle.terminalEmulators)),

    // Apple Terminal often needs explicit rules as well
    k.rule('C (Ctrl+Shift) [Only Apple Terminal]', k.input('c', ['control', 'shift']), k.outputKey('c', ['command']), k.condition('if', ['^com\\.apple\\.Terminal$'])),
    k.rule('V (Ctrl+Shift) [Only Apple Terminal]', k.input('v', ['control', 'shift']), k.outputKey('v', ['command']), k.condition('if', ['^com\\.apple\\.Terminal$'])),
  ],
}


