[Setting name="Clip Chrono" category="General"]
bool clipChrono = true;

void Main() {
    auto app = cast<CTrackMania>(GetApp());

    while (true) {
        yield();

        auto cp = app.CurrentPlayground;

        if (cp !is null) {
            auto intface = cp.Interface;
            
            auto controls = cast<CControlFrame@>(intface.ManialinkPage).Childs;
            if (controls.Length > 2) {
                auto first = cast<CControlFrame@>(controls[2]).Childs;
                auto second = cast<CControlFrame@>(first[0]).Childs;
                auto centerFrame = cast<CControlFrame@>(second[7]);
                auto centerFrameChilds = centerFrame.Childs;
                auto chrono_label = cast<CControlLabel@>(centerFrameChilds[0]);

                if (clipChrono && centerFrameChilds.Length < 6) {
                    CControlLabel@ newLabel = cast<CControlLabel@>(centerFrame.AddInstance(chrono_label, "#11", vec3(0,0,0)));
                    newLabel.Style.FontHeight = 0.16;
                    chrono_label.Style.LabelColorAlpha = 0;
                } else if (!clipChrono && centerFrameChilds.Length == 6) {
                    centerFrame.RemoveControl(centerFrameChilds[5]);
                    chrono_label.Style.LabelColorAlpha = 1;
                }

                if (clipChrono && centerFrameChilds.Length == 6) {
                    // print(chrono_label.Label);
                    cast<CControlLabel@>(centerFrameChilds[5]).Label = chrono_label.Label.SubStr(0, chrono_label.Label.Length-1);
                }

            }
            
        }

    }


}