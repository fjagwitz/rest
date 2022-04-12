#IMPORTANT: between the Request Information and the actual query: one line needs to be kept free
baseUrl="https://eu-artifactory.jfrog.tech"
accessToken="eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJ0eUxrUkhOTGwwQlNHclVOaUZ1bDg0YWlyNWhBMnlXNjRTOTVuYVNia2s0In0.eyJleHQiOiJ7XCJyZXZvY2FibGVcIjpcInRydWVcIn0iLCJzdWIiOiJqZmFjQDAxZnJqdDdqd2YxYW1hMWRzMWF0N20wcm5xXC91c2Vyc1wvZnZqLWFkbSIsInNjcCI6ImFwcGxpZWQtcGVybWlzc2lvbnNcL2FkbWluIiwiYXVkIjoiKkAqIiwiaXNzIjoiamZmZUAwMDAiLCJleHAiOjE2NzQxMjA1OTAsImlhdCI6MTY0MjU4NDU5MCwianRpIjoiZGY5MDRkMzEtZjQzZC00YzZkLTlmZDktN2FhZWMzY2U5YWExIn0.Ujx9SNeiu8ZQnTiroSRM_zHxbUNQBlxNhNX1mbKQet9DXxNcURMkOskQFJ3G7CZp_5sY4rnir9i9WuLCEEhhID00HecP1s9QED4ahwg648GgR8otMRbecL2231HWNyJRRdvt9jE0Z3euCkI8s3kQMp-n_eHC7bRSbHGvhe89RVvZKwU3kqTcrB1VjSzy0-ZhNDCRm3jvynSnEEBwZpGHLTlv9yJMj4Km-5EF_lPYs35zABNBklWXRfM12lV7Ou-geMoUKohz1ixVHCyaBxT95Hcyu-GSEyEGgjflUYvWSxEpbFrzWfZr7wuwsOQqa99xCTKKYYUIreZ3nO8KAJlmVw"

projectId="fd-"
projectMaxNumber=113
projectMinNumber=101
repoTech="npm pypi composer docker"
repoMaturity="dev test prod"
repoLocator="virtual"

while [ $projectMinNumber -le $projectMaxNumber ]
do  
    for repo in $repoTech
    do 
        for level in $repoMaturity    
        do
            projectKey=$projectId$projectMinNumber
            curl -H "Authorization: Bearer $accessToken" -X DELETE "$baseUrl/artifactory/api/repositories/$projectKey-$repo-$level"
        done 
    done
    projectMinNumber=$(( $projectMinNumber + 1 ))
done

