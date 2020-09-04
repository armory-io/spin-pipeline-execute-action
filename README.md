# spin-pipeline-execute-action


## Example Usage

The following example triggers the `Deploy to Production` pipeline for application `myapp`. The CLI configuration is provided via a secret, `SPIN_CLI_CONFIG`.

```
steps:
    - name: Trigger Spinnaker Pipelien
      uses: armory-io/spin-pipeline-execute-action@master
      with:
        application: myapp
        pipeline: 'Deploy to Production'
        configData: ${{ secrets.SPIN_CLI_CONFIG }}
```

If your pipeline accepts any parameters, they can be passed using the `parametersJson` option.

```
steps:
    - name: Trigger Spinnaker Pipelien
      uses: armory-io/spin-pipeline-execute-action@master
      with:
        application: myapp
        pipeline: 'Deploy to Production'
        configData: ${{ secrets.SPIN_CLI_CONFIG }}
        parametersJson: |
            {
                "GIT_BRANCH": "${{ github.ref }}",
                "SHA": "${{ github.sha }}""
            }
```