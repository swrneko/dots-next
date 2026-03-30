import QtQuick
import Quickshell.Io
import qs.Services.UI

Item {
  property var pluginApi: null

  IpcHandler {
    target: "plugin:kaomoji"
    function toggle() {
      pluginApi.withCurrentScreen(screen => {
        var launcherPanel = PanelService.getPanel("launcherPanel", screen);
        if (!launcherPanel)
          return;
        var searchText = launcherPanel.searchText || "";
        var isInKaomojiMode = searchText.startsWith(">kaomoji");
        if (!launcherPanel.isPanelOpen) {
          launcherPanel.open();
          launcherPanel.setSearchText(">kaomoji ");
        } else if (isInKaomojiMode) {
          launcherPanel.close();
        } else {
          launcherPanel.setSearchText(">kaomoji ");
        }
      });
    }
  }
}
