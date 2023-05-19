## Repo Analyzer

This script analyzes a set of git repositories, and give basic insights in form of json, which can be used by any frontend application to show insights.

![Script Demo](./assets/repo-analyzer-script-demo.gif)


The script is written in bash and javascript.

To run scripts, first clone the repo

1. Give executable permission to startup script.
    ```
        chmod +x startup.sh repo-stat.sh
    ```
2. Create a `config.json` in same directory. The content should look like
    ```json
        {
            "local_repos": [
                "path_of_repo_1",
                "path_of_repo_2"
            ]
        }
    ```
    - `local_repos`: Should contain path of git repositories available on the machine
3. Run
    ```
    ./startup.sh
    ```

The generated output looks as follows

```json
{
    "summary":{
        "author_name":{
            "total_contributions": 0,
            "total_lines_added": 0,
            "total_lines_deleted": 0
        }
    },
    "user_wise_stats":{
        "author_name":[
            {
                "repo_path": "path_of_repo_1",
                "contributions": 0,
                "lines_added": 0,
                "lines_deleted": 0
            },
            {
                "repo_path": "path_of_repo_2",
                "contributions": 0,
                "lines_added": 0,
                "lines_deleted": 0
            }
        ]
    }
}
```

In further development following points will be addressed.

- Additional parameters will be added to config.json
    - To skip `merge commits`
    - To skip selected files such as `package-lock.json`
    - Generate Heatmat of commited code
- Refactor rate will be calculated
- Copy/pasting of similar code will be identified
- Code quality against developer will be generated, based on models by tools such as `sonarcube` and `jarchitect`
- Identifying common recurring problems in code style and raising concerns.
- Using the generated JSON in a frontend dashboard.