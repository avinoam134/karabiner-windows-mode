// Browser-specific rules

local bundle = import 'lib/bundle.libsonnet';
local k = import 'lib/karabiner.libsonnet';

{
  rules: [
    k.rule('H (Ctrl) [Only Web Browsers]', k.input('h', ['control']), k.outputKey('y', ['command']), k.condition('if', bundle.webBrowsers)),
    k.rule('L (Ctrl) [Only Web Browsers]', k.input('l', ['control']), k.outputKey('l', ['command']), k.condition('if', bundle.webBrowsers)),

    // Chrome-only
    k.rule('F4 (Ctrl) [Only Chrome]', k.input('f4', ['control']), k.outputKey('w', ['command']), k.condition('if', ['^com\\.google\\.Chrome$', '^com\\.google\\.chrome$'])),
    k.rule('F5 [Only Chrome]', k.input('f5'), k.outputKey('r', ['command']), k.condition('if', ['^com\\.google\\.Chrome$', '^com\\.google\\.chrome$'])),
  ],
}


