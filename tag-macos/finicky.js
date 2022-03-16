module.exports = {
  defaultBrowser: "Browserosaurus",
  options: {
    checkForUpdate: true
  },
  rewrite: [
    {
      match: () => true, // Execute rewrite on all incoming urls to make this example easier to understand
      url({ url }) {
        const removeKeysStartingWith = ["utm_", "uta_"]; // Remove all query parameters beginning with these strings
        const removeKeys = ["fblid", "gclid"]; // Remove all query parameters matching these keys

        const search = url.search
          .split("&")
          .map((parameter) => parameter.split("="))
          .filter(([key]) => !removeKeysStartingWith.some((startingWith) => key.startsWith(startingWith)))
          .filter(([key]) => !removeKeys.some((removeKey) => key === removeKey));

        return {
          ...url,
          search: search.map((parameter) => parameter.join("=")).join("&"),
        };
      }
    },
    {
      match: ({ url }) => url.host === "www.amazon.com",
      url: {
        host: "smile.amazon.com",
        protocol: 'https',
        search: ''
      }
    },
    {
      match: ({ url }) => url.host === "apne.ws",
      url: {
        protocol: 'http',
      }
    }
  ],
  handlers: [
/*
    {
      match: finicky.matchHostnames([
          /courier-journal\.com/
      ]),
      browser: ({urlString}) => ({
          name: "Firefox",
          args: ["--private-window", urlString]
      })
    }, */
    {
      // Open Apple Music links directly in Music.app
      match: [
          "music.apple.com*",
          "geo.music.apple.com*",
      ],
      url: {
          protocol: "itmss"
      },
      browser: "Music",
    },
    {
      match: [
        "zoom.us/*",
        finicky.matchDomains(/.*\zoom.us/),
        /zoom.us\/j\//,
      ],
      browser: "us.zoom.xos"
    },
    {
      // Open Google Drive in Firefox if opened from Slack
      match: ({ opener, url }) => opener.bundleId === "com.tinyspeck.slackmacgap" && url.host.includes("drive.google.com"),
      browser: "Firefox"
    },
    {
      match: finicky.matchHostnames([
          /console.aws.amazon.com$/,
          /missiondata\.(net|com)?/
      ]),
      browser: "Google Chrome"
    },
    {
      match: ({ opener }) => [
          "com.tapbots.Tweetbot3Mac",
          "com.apple.MobileSMS"
      ].includes(opener.bundleId),
      browser: "Firefox"
    },
    {
      match: finicky.matchHostnames([
          "smile.amazon.com",
          /facebook\.com/,
          /linkedin\.com/,
          /reddit\.com/,
          /twitter\.com/,
          /youtube\.com/
      ]),
      browser: "Firefox"
    }
  ]
};
