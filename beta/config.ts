import { Config, Mode } from './src/types';

export default {
  defaultLocale: 'eng',
  htmlUrl: 'https://beta.apertium.org/',
  apyURL: 'https://beta.apertium.org/apy',
  matomoConfig: {
    urlBase: 'https://matomo.apertium.org/',
    siteId: 7,
  },

  defaultMode: Mode.Translation,
  enabledModes: new Set([Mode.Translation, Mode.Analysis, Mode.Generation]),
  translationChaining: true,

  subtitle: 'Beta',
  subtitleColor: 'rgb(220, 41, 38)',

  stringReplacements: {
    '{{maintainer}}': "<a href='https://wiki.apertium.org/wiki/Apertium' target='_blank' rel='noopener'>Apertium</a>",
    '{{more_languages}}': "<a href='https://beta.apertium.org' rel='noreferrer'  target='_blank'>beta.apertium.org</a>",
  },
  showMoreLanguagesLink: false,
} as Config;
