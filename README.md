# Migrate Artifacts

Migrate Artifacts helps automate migrating artifacts from one repository to another 

## Pre-requirements 
* [Node.js](https://nodejs.org/en/)
## Usage 
1. Clone this project
```bash 
git clone https://github.com/achraf17/artifacts-migration
```
2. Install dependencies 
```bash
npm install
```
### Update release notes of a project
1. You will need an access token from github. you can use this [link](https://github.com/settings/tokens/new) to generate one. 
PS: repo scope level is enough for this.
2. Replace the generated token in place of `ACCESS_TOKEN` on the `updateReleaseNotes.js`
3. Update `REPO_OWNER`, `REPO_NAME` with the appropriate values.
4. Update the urls depending on requirements.
5. Run the script
```bash
node updateReleaseNotes.js
```

### Download artifacts
1. Update list of versions in `bintrayDownload.sh`
2. Update the url 
3. Run the script
``` bash
bash bintrayDownload.sh
```

### Upload the artifacts to cloudsmith
1. Generate a cloud smith api key and update `CLOUDSMITH_API_KEY` with it
2. Update the naming of the files and the summary
3. Run the script
``` bash
bash uploadToCloudSmith.sh
```