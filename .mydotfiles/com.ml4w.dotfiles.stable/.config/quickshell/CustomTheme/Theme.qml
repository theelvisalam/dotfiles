pragma Singleton
import QtQuick
import Quickshell 
import Quickshell.Io 

QtObject { 
    id: root
    
    // Static properties
    readonly property string fontFamily: "AnonymicePro Nerd Font"
    
    // Kanagawa Dragon on black
    property color background: "#000000"
    property color error: "#c4746e"
    property color error_container: "#282727"
    property color inverse_on_surface: "#000000"
    property color inverse_primary: "#c4746e"
    property color inverse_surface: "#c5c9c5"
    property color on_background: "#c5c9c5"
    property color on_error: "#000000"
    property color on_error_container: "#c5c9c5"
    property color on_primary: "#000000"
    property color on_primary_container: "#c5c9c5"
    property color on_primary_fixed: "#000000"
    property color on_primary_fixed_variant: "#c5c9c5"
    property color on_secondary: "#000000"
    property color on_secondary_container: "#c5c9c5"
    property color on_secondary_fixed: "#000000"
    property color on_secondary_fixed_variant: "#c5c9c5"
    property color on_surface: "#c5c9c5"
    property color on_surface_variant: "#a6a69c"
    property color on_tertiary: "#000000"
    property color on_tertiary_container: "#c5c9c5"
    property color on_tertiary_fixed: "#000000"
    property color on_tertiary_fixed_variant: "#c5c9c5"
    property color outline: "#393836"
    property color outline_variant: "#282727"
    property color primary: "#c4746e"
    property color primary_container: "#282727"
    property color primary_fixed: "#c4746e"
    property color primary_fixed_dim: "#c4746e"
    property color scrim: "#000000"
    property color secondary: "#8ba4b0"
    property color secondary_container: "#282727"
    property color secondary_fixed: "#8ba4b0"
    property color secondary_fixed_dim: "#8ba4b0"
    property color shadow: "#000000"
    property color source_color: "#c4746e"
    property color surface: "#000000"
    property color surface_bright: "#393836"
    property color surface_container: "#12120f"
    property color surface_container_high: "#1d1c19"
    property color surface_container_highest: "#282727"
    property color surface_container_low: "#0d0c0c"
    property color surface_container_lowest: "#000000"
    property color surface_dim: "#000000"
    property color surface_tint: "#c4746e"
    property color surface_variant: "#282727"
    property color tertiary: "#c4b28a"
    property color tertiary_container: "#282727"
    property color tertiary_fixed: "#c4b28a"
    property color tertiary_fixed_dim: "#c4b28a"

    property var themeReader: Process {
        id: reader
        command: ["cat", Quickshell.env("HOME") + "/.config/ml4w/colors/colors.json"]
        
        stdout: StdioCollector {
            onStreamFinished: {
                var output = this.text.trim();
                
                if (output !== "") {
                    try {
                        var newColors = JSON.parse(output);
                        for (var key in newColors) {
                            if (root.hasOwnProperty(key) && key !== "objectName") {
                                root[key] = newColors[key];
                            }
                        }
                        console.log("Theme colors loaded successfully!");
                    } catch (e) {
                        console.log("Failed to parse theme JSON: " + e);
                    }
                }
            }
        }
    }

    function reloadTheme() {
        return; // keep Kanagawa Dragon colors
        reader.running = false;
        reader.running = true;
    }

    // Component.onCompleted: reloadTheme()
}
