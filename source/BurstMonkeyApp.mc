// Copyright 2022 Harrison Chin
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Toybox.Application;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.WatchUi;

//! This application demonstrates bursting over a Generic Channel in Ant
class BurstMonkeyApp extends Application.AppBase {

    private const UI_UPDATE_PERIOD_MS = 250;

    private var _channelManager as BurstChannelManager;
    private var _uiTimer as Timer.Timer;

    //! Constructor.
    public function initialize() {
        AppBase.initialize();
        _channelManager = new $.BurstChannelManager();
        _uiTimer = new Timer.Timer();
    }

    //! Handle app startup
    //! @param state Startup arguments
    public function onStart(state as Dictionary?) as Void {
        _uiTimer.start(method(:updateScreen), UI_UPDATE_PERIOD_MS, true);
    }

    //! Handle app shutdown
    //! @param state Shutdown arguments
    public function onStop(state as Dictionary?) as Void {
        _uiTimer.stop();
    }

    //! Return the initial views for the app
    //! @return Array Pair [View, InputDelegate]
    public function getInitialView() as Array<Views or InputDelegates>? {
        return [new $.BurstMonkeyView(_channelManager), new $.BurstMonkeyDelegate(_channelManager)] as Array<Views or InputDelegates>;
    }

    //! A wrapper function to allow the timer to request a screen update
    public function updateScreen() as Void {
        WatchUi.requestUpdate();
    }
}
