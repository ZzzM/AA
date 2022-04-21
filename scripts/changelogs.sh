function transform() {
    local changelog=`cat $1`
    changelog=${changelog%%---*}
    changelog=${changelog#*###}
    echo "###$changelog"
}


function sparkle_enclosure() {
    local signature=`$PWD/assets/sign_update -s $SPARKLE_KEY $APP_NAME.dmg`
    local enclosure="
    <enclosure 
    url=\"$GITHUB_SERVER_URL/$GITHUB_REPOSITORY/releases/download/$APP_VERSION/$APP_NAME.dmg\" 
    sparkle:version=\"$APP_BUILD\" 
    sparkle:shortVersionString=\"$APP_VERSION\" 
    $signature
    type=\"application/octet-stream\" 
    />
    "
    echo $enclosure
}

function release_changlogs() {
    local flag="<?"
    local all="
    $(transform CHANGELOG.md)
    $flag
    $(transform CHANGELOG_SC.md)
    $flag
    $sparkle_enclosure
    "
    echo $all > Release.md
}

release_changlogs

