pybot -d robot_test_results/macosx_firefox \
      -i AIM1 \
      -i Smoke \
      -v DEVICE:desktop \
      -v ENVIRONMENT:test \
      -v TEAM:AIM \
      -v BROWSER:chrome \
      -v SAUCE_URL:"http://Chickoree:d61c8e10-8463-43a7-8f87-c096dd42ade7@ondemand.saucelabs.com:80/wd/hub" \
      -v SAUCE_CAPABILITIES:"browserName:chrome,version:40" \
      -v GA_USER:"ahall@medullan.com" \
      -v GA_PASSWORD:"something" \
      tests

# "http://denisdbell:c712d3ba-d51f-4b80-afaf-6dd0c699362a@ondemand.saucelabs.com:80/wd/hub" \