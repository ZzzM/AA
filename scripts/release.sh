function release() {

    create_dmg
    generate_changlog
    
}

function __transform() {
    local changelog=`cat $1`
    changelog=${changelog%%---*}
    changelog=${changelog#*###}
    changelog="###$changelog"
    echo "$changelog<!--"
}

function __sparkle_enclosure() {
    local dmg_path=$BUILD_PATH/$APP_NAME.dmg
    local signature=`echo $SPARKLE_KEY | ./bin/sign_update -f - $dmg_path`
    local enclosure="<sparkle:version>$APP_VERSION</sparkle:version>
    <sparkle:minimumSystemVersion>$SYS_MIN_VERSION</sparkle:minimumSystemVersion>
    <enclosure url=\"$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/releases/download/$APP_VERSION/$APP_NAME.dmg\" $signature type=\"applicationoctet-stream\" />"
    echo $enclosure
}

function create_dmg() {
    cd $BUILD_PATH
    if [ -f "$APP_NAME.app.dSYM.zip" ]; then
    brew install graphicsmagick imagemagick
    npm install --global create-dmg
    create-dmg $APP_NAME.app
    mv $APP_NAME*.dmg $APP_NAME.dmg
    else
    UI.user_error!("💥 $APP_NAME.app does not exist.")
    fi
    cd ..
}

function generate_changlog() {
    local log_path=$BUILD_PATH/TMP.md
    echo "$(__transform changelogs/CHANGELOG.md)" > $log_path
    echo "$(__transform changelogs/CHANGELOG_SC.md)" >> $log_path
    echo $(__sparkle_enclosure) >> $log_path
}



release