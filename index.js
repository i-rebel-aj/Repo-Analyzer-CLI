const config=require('./config.json')
const stats=[]
async function getPathString(){
    console.log(config.local_repos.join(' '))
}
async function parseOutFileData(){
    const parsed_output=require('./output.json')
    //TODO: Add Collective Graph here
    console.log('Output is', parsed_output)
}


const argument = process.argv[2];

if (argument === "getPathString") {
    getPathString();
} else if (argument === "parseOutFileData") {
    parseOutFileData();
}