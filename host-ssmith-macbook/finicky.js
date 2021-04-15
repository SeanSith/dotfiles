module.exports = {
  defaultBrowser: "Browserosaurus",
  rewrite: [
    {
      match: ({ url }) => url.host.endsWith("www.amazon.com"),
      url: {
        host: "smile.amazon.com",
        protocol: 'https',
        search: ''
      },
    }
  ],
  handlers: [
    {
      match: ({ opener }) =>
        opener.bundleId === "com.tapbots.Tweetbot3Mac",
        browser: "Firefox"
    },
    {
      match: ({ url }) => url.host.endsWith("missiondata.net"),
      browser: "Google Chrome",
    },
    {
      match: ({ url }) => url.host.endsWith("missiondata.com"),
      browser: "Google Chrome",
    },
    {
      match: finicky.matchHostnames(
        [
          "apple.com"
        ]
      ),
      browser: "Safari"
    },
    {
      match: finicky.matchHostnames(
        [
          "console.aws.amazon.com"
        ]
      ),
      browser: "Google Chrome"
    },
    {
      match: finicky.matchHostnames(
        [
          "/(www\.)?facebook.com/",
          "/(www\.)?linkedin.com/",
          "/(www\.)?reddit.com/",
          "smile.amazon.com",
          "/(www\.)?twitter.com/",
          "/(www\.)?youtube.com/"
        ]
      ),
    browser: "Firefox"
    }
  ]
};
