import { Config, Mode } from './src/types';

export default {
  defaultLocale: 'eng',
  htmlUrl: 'https://apertium.org/',
  apyURL: 'https://apertium.org/apy',
  matomoConfig: {
    urlBase: 'https://matomo.apertium.org/',
    siteId: 1,
  },

  defaultMode: Mode.Translation,
  enabledModes: new Set([Mode.Translation]),
  translationChaining: false,

  allowedVariants: new Set(['BR', 'aran', 'valencia', 'e', 'PTpre1990', 'gascon']),

  stringReplacements: {
    '{{maintainer}}': "<a href='https://wiki.apertium.org/wiki/Apertium' target='_blank' rel='noopener'>Apertium</a>",
    '{{more_languages}}': "<a href='https://beta.apertium.org' rel='noreferrer'  target='_blank'>beta.apertium.org</a>",
  },
  showMoreLanguagesLink: true,
} as Config;
