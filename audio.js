const bigbluebot = require('bigbluebot');

const actions = async page => {
  await bigbluebot.audio.modal.microphone(page);
};

bigbluebot.run(actions);
