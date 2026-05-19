const defaultConfig = {
  swf: "./SFPA-web-patched.swf",
  width: 800,
  height: 500
};

function updateStatus(element, title, message) {
  element.innerHTML = `<div><strong>${title}</strong><p>${message}</p></div>`;
}

function createPlayer(container) {
  const ruffle = window.RufflePlayer?.newest?.();
  if (!ruffle) {
    throw new Error("Ruffle runtime did not initialize.");
  }

  const player = ruffle.createPlayer();
  player.classList.add("rufflePlayer");
  player.style.width = "100%";
  player.style.height = "100%";
  player.style.display = "block";
  return player;
}

async function bootGame() {
  const container = document.getElementById("gameContainer");
  const status = document.getElementById("gameStatus");
  const config = { ...defaultConfig, ...(window.SFPA_WEB_CONFIG ?? {}) };

  if (!container || !status) {
    return;
  }

  updateStatus(
    status,
    "Starting browser runtime",
    "Loading the Flash compatibility layer and preparing the game files."
  );

  try {
    const player = createPlayer(container);
    container.querySelector(".gameStage")?.appendChild(player);

    await player.ruffle().load({
      url: config.swf,
      base: "./",
      allowFullscreen: true,
      backgroundColor: "#000000",
      letterbox: "on",
      menu: false,
      scale: "showAll",
      splashScreen: false,
      warnOnUnsupportedContent: true
    });

    container.classList.add("is-ready");
    updateStatus(
      status,
      "Runtime loaded",
      "If the game remains black after this point, the remaining blocker is inside Flash/AIR emulation rather than the shell."
    );
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error);
    updateStatus(
      status,
      "Game failed to start",
      `The browser runtime could not load the game: ${detail}`
    );
    console.error(error);
  }
}

window.RufflePlayer = window.RufflePlayer || {};
window.RufflePlayer.config = {
  autoplay: "on",
  backgroundColor: "#000000",
  menu: false,
  splashScreen: false,
  unmuteOverlay: "hidden",
  warnOnUnsupportedContent: true
};

window.addEventListener("DOMContentLoaded", () => {
  void bootGame();
});
