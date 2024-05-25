# ━━ Cleanup local orphaned packages ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end
