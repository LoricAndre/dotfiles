// <3 Aylur for this brightness service
import { bash, dependencies, sh } from "lib/utils"

if (!dependencies("hypridle"))
    App.quit()

const isRunning = Utils.exec("pgrep hypridle");
const start = Utils.exec("nohup hypridle >/dev/null 2>&1 &");
const stop = Utils.exec("pkill hypridle");

class screensaver extends Service {
    static {
        Service.register(this, {}, {})
    }

    constructor() {
        super()

        Utils.monitorFile(screenPath, async f => {
            const v = await Utils.readFileAsync(f)
            this.#screen = Number(v) / this.#screenMax
            this.changed("screen")
        })

        Utils.monitorFile(kbdPath, async f => {
            const v = await Utils.readFileAsync(f)
            this.#kbd = Number(v) / this.#kbdMax
            this.changed("kbd")
        })
    }
}

export default new screensaver
