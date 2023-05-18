const { exec , execSync} = require('child_process');
const config=require('./config.json')
const statScript='./repo-stat.sh'
async function main(){
    for (const local_repo of config.local_repos) {
      const output= await execSync(`bash ${statScript} ${local_repo}`);
      //const script_output=execSync(statScript, [local_repo])
      console.log('stdout', output.toString())   
    }
}
main()

