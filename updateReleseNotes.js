const { Octokit } = require("@octokit/rest");

// TODO: change these values
const owner = 'REPO_OWNER' //  ex. 'ConsenSys'
const repo = 'REPO_NAME' // ex. 'quorum'
const auth = 'ACCESS_TOKEN' // ex. 'ea5330f68542cdabfb92a4517b1b702ef70504f6'
// TODO: update the URLs based on the requirements 
const oldUrl = 'bintray.com/quorumengineering/quorum/download_file?file_path='
const newUrl = 'artifacts.consensys.net/public/go-quorum/raw/versions/'

(async () => {
  const octokit = new Octokit({ auth });
  const { data: releases } = await octokit.repos.listReleases({
    owner,
    repo,
  });

  for (const release of releases) {
    console.log('Release id to be updated :>> ', release.id);
    await octokit.repos.updateRelease({
      owner,
      repo,
      release_id: release.id,
      body: release.body.split(oldUrl).join(newUrl)
    });
    console.log('Release id updated :>> ', release.id);
  }
})()