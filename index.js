const config=require('./config.json')
const util=require('util')
const stats={
    summary: {},
    user_wise_stats:{}
}
async function getPathString(){
    console.log(config.local_repos.join(' '))
}
async function parseOutFileData(){
    const parsed_output=require('./output.json')
    //TODO: Add Collective Graph here
    // console.log('Output is', util.inspect(parsed_output[0].stats['Akshay Jain'], null) )
    for (const repo_stat of parsed_output) {
        for (const name in repo_stat.stats) {
            if(!stats.summary[name]){
                stats.summary[name]={
                    total_contributions: 0,
                    total_lines_added: 0,
                    total_lines_deleted: 0
                }
            }
            if (Object.hasOwnProperty.call(repo_stat.stats, name)) {
                if(!stats.user_wise_stats[name]?.length){
                    stats.user_wise_stats[name]=[{
                        repo_path: repo_stat.path,
                        contributions: repo_stat.stats[name].contributions,
                        lines_added: repo_stat.stats[name].lines_added,
                        lines_deleted: repo_stat.stats[name].lines_deleted
                    }]
                }else{
                    stats.user_wise_stats[name].push({
                        repo_path: repo_stat.path,
                        contributions: repo_stat.stats[name].contributions,
                        lines_added: repo_stat.stats[name].lines_added,
                        lines_deleted: repo_stat.stats[name].lines_deleted
                    })
                }
                stats.summary[name]['total_contributions']+=repo_stat.stats[name].contributions
                stats.summary[name]['total_lines_added']+=repo_stat.stats[name].lines_added
                stats.summary[name]['total_lines_deleted']+=repo_stat.stats[name].lines_deleted           
            }
        }
    }
    console.log('User stats are', stats )

}


const argument = process.argv[2];

if (argument === "getPathString") {
    getPathString();
} else if (argument === "parseOutFileData") {
    parseOutFileData();
}