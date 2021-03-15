const bigbluebot = require('bigbluebot');

const actions = async page => {
  await bigbluebot.video.join(page);
};

bigbluebot.run(actions);