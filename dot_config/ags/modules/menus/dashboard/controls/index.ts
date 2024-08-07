import { bash } from "lib/utils";

const network = await Service.import("network");
const bluetooth = await Service.import("bluetooth");
const notifications = await Service.import("notifications");
const audio = await Service.import("audio");
// const screensaver = await Service.import("screensaver");

const Controls = () => {
  return Widget.Box({
    class_name: "dashboard-card controls-container",
    hpack: "fill",
    vpack: "fill",
    expand: true,
    children: [
      Widget.Button({
        tooltip_text: "Toggle Wifi",
        expand: true,
        setup: (self) => {
          self.hook(network, () => {
            return (self.class_name = `dashboard-button wifi ${!network.wifi.enabled ? "disabled" : ""}`);
          });
        },
        on_primary_click: () => network.toggleWifi(),
        child: Widget.Label({
          setup: (self) => {
            self.hook(network, () => {
              return (self.label = network.wifi.enabled ? "󰤨" : "󰤭");
            });
          },
        }),
      }),
      Widget.Button({
        tooltip_text: "Toggle Bluetooth",
        expand: true,
        class_name: bluetooth
          .bind("enabled")
          .as(
            (btOn) => `dashboard-button bluetooth ${!btOn ? "disabled" : ""}`,
          ),
        on_primary_click: () => bluetooth.toggle(),
        child: Widget.Label({
          label: bluetooth.bind("enabled").as((btOn) => (btOn ? "󰂯" : "󰂲")),
        }),
      }),
      Widget.Button({
        tooltip_text: "Toggle Notifications",
        expand: true,
        class_name: notifications
          .bind("dnd")
          .as(
            (dnd) => `dashboard-button notifications ${dnd ? "disabled" : ""}`,
          ),
        on_primary_click: () => (notifications.dnd = !notifications.dnd),
        child: Widget.Label({
          label: notifications.bind("dnd").as((dnd) => (dnd ? "󰂛" : "󰂚")),
        }),
      }),
      Widget.Button({
        tooltip_text: "Toggle Mute (Playback)",
        expand: true,
        on_primary_click: () =>
          (audio.speaker.is_muted = !audio.speaker.is_muted),
        setup: (self) => {
          self.hook(audio, () => {
            return (self.class_name = `dashboard-button playback ${audio.speaker.is_muted ? "disabled" : ""}`);
          });
        },
        child: Widget.Label({
          setup: (self) => {
            self.hook(audio, () => {
              return (self.label = audio.speaker.is_muted ? "󰖁" : "󰕾");
            });
          },
        }),
      }),
      Widget.Button({
        tooltip_text: "Toggle Screen Saver",
        expand: true,
        on_primary_click: (self) => {
          bash`pgrep hypridle && pkill hypridle || nohup hypridle >/dev/null 2>&1 &`;
        },
        child: Widget.Label({
        }).poll(1000, label => label.label = Utils.exec(`bash -c "pgrep hypridle >/dev/null 2>&1 && echo '󰈉' || echo '󰈈'" `)),
      }).poll(1000, button => button.class_name = Utils.exec(`bash -c "pgrep hypridle >/dev/null 2>&1 && echo 'dashboard-button screensaver disabled' || echo 'dashboard-button screensaver'"`)),
    ],
  });
};

export { Controls };
