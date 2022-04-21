

function transform() {
    local changelog=`cat $1`
    changelog=${changelog%%---*}
    changelog=${changelog#*###}
    changelog="###$changelog"
    echo "$changelog<?"
}


function sparkle_enclosure() {
    local signature=`$PWD/assets/sign_update -s $SPARKLE_KEY $APP_NAME.dmg`
    local enclosure="<enclosure 
    url=\"$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/releases/download/$APP_VERSION/$APP_NAME.dmg\" 
    sparkle:version=\"$APP_VERSION\" 
    $signature
    type=\"application/octet-stream\" />"
    echo $enclosure
}

function generate_changlog() {
    echo "$(transform CHANGELOG.md)" > $BODY_PATH
    echo "$(transform CHANGELOG_SC.md)" >> $BODY_PATH
    echo $(sparkle_enclosure) >> $BODY_PATH
}


function create_dmg() {
    brew install create-dmg
        create-dmg \
        --volicon assets/volicon.icns \
        --hdiutil-quiet \
        --app-drop-link 0 30  \
        $APP_NAME.dmg $APP_NAME.app
}

function test() {

    echo "$(transform CHANGELOG.md)" > TEST.md
    echo "$(transform CHANGELOG_SC.md)" >> TEST.md

}
# test
create_dmg
generate_changlog


