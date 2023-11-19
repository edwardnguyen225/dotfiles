function git_clean_merged_branches
    set --local current_branch (git branch --show-current)
    for branch in develop staging master main
        git checkout $branch
        set --local merged_branches (git branch --merged | grep -v "$branch\|\*" | sed 's/^[ \t]*//' | sed 's/[ \t]*$//')
        for merged_branch in $merged_branches
            git branch -d "$merged_branch"
        end
    end
    git checkout $current_branch
end
