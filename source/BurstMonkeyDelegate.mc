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

import Toybox.Lang;
import Toybox.WatchUi;

class BurstMonkeyDelegate extends WatchUi.BehaviorDelegate {

    private var _channelManager as BurstChannelManager;

    //! Constructor
    //! @param aChannelManager The channel manager in use
    public function initialize(aChannelManager as BurstChannelManager) {
        _channelManager = aChannelManager;
        BehaviorDelegate.initialize();
    }

    //! Sends a burst message when the menu button is pressed
    //! @return true if handled, false otherwise
    public function onMenu() as Boolean {
        _channelManager.sendBurst();
        return true;
    }

}