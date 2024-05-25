complete -c lutgen -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c lutgen -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c lutgen -n "__fish_use_subcommand" -f -a "generate" -d 'Generate a hald clut for external or manual usage'
complete -c lutgen -n "__fish_use_subcommand" -f -a "apply" -d 'Correct an image using a hald clut, either generating it, or loading it externally'
complete -c lutgen -n "__fish_use_subcommand" -f -a "completions" -d 'Generate shell completions'
complete -c lutgen -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s p -l palette -d 'Predefined popular color palettes. Use `lutgen -p` to view all options. Compatible with custom colors' -r -f -a "{abernathy	'',aci-gogh	'',aco-gogh	'',adventure	'',adventuretime	'',afterglow	'',afterglow-gogh	'',alabaster	'',alienblood	'',andromeda	'',apathy-base16	'',apple-classic	'',apprentice-base16	'',argonaut	'',arthur	'',ashes-base16	'',ashes-light-terminal-sexy	'',atelier-cave-base16	'',atelier-cave-light-base16	'',atelier-dune-base16	'',atelier-dune-light-base16	'',atelier-estuary-base16	'',atelier-estuary-light-base16	'',atelier-forest-base16	'',atelier-forest-light-base16	'',atelier-heath-base16	'',atelier-heath-light-base16	'',atelier-lakeside-base16	'',atelier-lakeside-light-base16	'',atelier-plateau-base16	'',atelier-plateau-light-base16	'',atelier-savanna-base16	'',atelier-savanna-light-base16	'',atelier-seaside-base16	'',atelier-seaside-light-base16	'',atelier-sulphurpool-base16	'',atelier-sulphurpool-light-base16	'',ateliersulphurpool	'',atelierdune-dark-terminal-sexy	'',atelierdune-light-terminal-sexy	'',atelierforest-dark-terminal-sexy	'',atelierforest-light-terminal-sexy	'',atelierheath-dark-terminal-sexy	'',atelierheath-light-terminal-sexy	'',atelierlakeside-dark-terminal-sexy	'',atelierlakeside-light-terminal-sexy	'',atelierseaside-dark-terminal-sexy	'',atelierseaside-light-terminal-sexy	'',atlas-base16	'',atom	'',atomonelight	'',aura-gogh	'',aurora	'',ayu-dark-gogh	'',ayu-light-gogh	'',ayu-mirage	'',ayu-mirage-gogh	'',azu-gogh	'',banana-blueberry	'',batman	'',belafonte-day	'',belafonte-night	'',belge-terminal-sexy	'',bespin-base16	'',bespin-light-terminal-sexy	'',bim-gogh	'',birdsofparadise	'',biscuit-dark	'',biscuit-light	'',bitmute-terminal-sexy	'',black-metal-bathory-base16	'',black-metal-burzum-base16	'',black-metal-dark-funeral-base16	'',black-metal-gorgoroth-base16	'',black-metal-immortal-base16	'',black-metal-khold-base16	'',black-metal-marduk-base16	'',black-metal-mayhem-base16	'',black-metal-nile-base16	'',black-metal-venom-base16	'',black-metal-base16	'',blazer	'',bleh1-terminal-sexy	'',blue-matrix	'',blueberrypie	'',bluedolphin	'',bluloco-light-gogh	'',bluloco-zsh-light-gogh	'',blulocodark	'',blulocolight	'',borland	'',breath-gogh	'',breath-darker-gogh	'',breath-light-gogh	'',breath-silverfox-gogh	'',breeze	'',breeze-gogh	'',brewer-base16	'',brewer-light-terminal-sexy	'',bright-base16	'',bright-lights	'',broadcast	'',brogrammer	'',brogrammer-base16	'',brush-trees-base16	'',brush-trees-dark-base16	'',builtin-dark	'',builtin-light	'',builtin-pastel-dark	'',builtin-solarized-dark	'',builtin-solarized-light	'',builtin-tango-dark	'',builtin-tango-light	'',c64	'',cga	'',clrs	'',cai-gogh	'',calamity	'',canvased-pastel-terminal-sexy	'',carburetor	'',carburetor-cool	'',carburetor-warm	'',catch-me-if-you-can-terminal-sexy	'',catppuccin-frappe	'',catppuccin-latte	'',catppuccin-macchiato	'',catppuccin-mocha	'',catppuccin-oled	'',chalk	'',chalk-gogh	'',chalk-base16	'',chalk-light-terminal-sexy	'',chalkboard	'',challengerdeep	'',chameleon-gogh	'',chester	'',ciapre	'',circus-base16	'',city-streets-terminal-sexy	'',classic-dark-base16	'',classic-light-base16	'',clone-of-ubuntu-gogh	'',cloud-terminal-sexy	'',cobalt-neon	'',cobalt2	'',codeschool-base16	'',codeschool-light-terminal-sexy	'',color-star-terminal-sexy	'',colorcli-gogh	'',colorful-colors-terminal-sexy	'',colors-base16	'',count-von-count-terminal-sexy	'',crayonponyfish	'',cupcake-base16	'',cupertino-base16	'',cyberdyne	'',dwm-rob-terminal-sexy	'',danqing-base16	'',danqing-light-base16	'',darcula-base16	'',dark-ocean-terminal-sexy	'',dark-pastel	'',dark-plus	'',dark-violet-base16	'',darkside	'',darktooth-base16	'',dawn-terminal-sexy	'',day3024	'',deafened-terminal-sexy	'',decaf-base16	'',default-light-terminal-sexy	'',default-dark-base16	'',default-light-base16	'',dehydration-gogh	'',derp-terminal-sexy	'',desert	'',digerati-terminal-sexy	'',dimmedmonokai	'',dissonance-gogh	'',django	'',djangorebornagain	'',djangosmooth	'',doom-peacock	'',doomone	'',dotgov	'',dotshare-terminal-sexy	'',dracula	'',duotone-dark	'',encom	'',earthsong	'',edge-dark-base16	'',edge-light-base16	'',efautumn	'',efbio	'',efcherie	'',efdark	'',efspring	'',efsummer	'',eftriodark	'',eftriolight	'',eftritanopiadark	'',efwinter	'',eighties-base16	'',eighties-light-terminal-sexy	'',eldorado-dark-terminal-sexy	'',elemental	'',elementary	'',elementary-gogh	'',elic-gogh	'',elio-gogh	'',embers-base16	'',embers-light-terminal-sexy	'',epiphany-terminal-sexy	'',eqie6-terminal-sexy	'',equilibrium-dark-base16	'',equilibrium-gray-dark-base16	'',equilibrium-gray-light-base16	'',equilibrium-light-base16	'',erebus-terminal-sexy	'',espresso	'',espresso-base16	'',espresso-libre	'',euphrasia-terminal-sexy	'',eva-base16	'',eva-dim-base16	'',everblush	'',everforest-dark-gogh	'',everforest-light-gogh	'',fahrenheit	'',fairy-fl-ss-gogh	'',fairy-fl-ss-dark-gogh	'',fairyfl-ss	'',farside-terminal-sexy	'',fideloper	'',firefoxdev	'',firewatch	'',fishtank	'',fishbone-terminal-sexy	'',flat	'',flat-gogh	'',flat-base16	'',flat-remix-gogh	'',flatland	'',floraverse	'',forestblue	'',foxnightly-gogh	'',framer	'',framer-base16	'',freya-gogh	'',frontenddelight	'',fruit-soda-base16	'',funforrest	'',gjm-terminal-sexy	'',galaxy	'',galizur	'',geohot-gogh	'',gigavolt-base16	'',github-dark	'',github	'',github-base16	'',glacier	'',gogh-gogh	'',gooey-gogh	'',google-light-terminal-sexy	'',google-dark-gogh	'',google-dark-base16	'',google-light-gogh	'',google-light-base16	'',gotham-gogh	'',grandshell-terminal-sexy	'',grape	'',grass	'',grayscale-light-terminal-sexy	'',grayscale-dark-base16	'',grayscale-light-base16	'',green-screen-base16	'',greenscreen-light-terminal-sexy	'',greygreen	'',gruber-base16	'',gruvbox-dark	'',gruvbox-dark-hard	'',gruvbox-dark-soft	'',gruvbox-light	'',gruvbox-light-hard	'',gruvbox-light-soft	'',guezwhoz	'',hax0r-blue	'',hax0r-gr33n	'',hax0r-r3d	'',hacktober	'',hardcore	'',hardcore-base16	'',harmonic16-dark-base16	'',harmonic16-light-base16	'',harper	'',heetch-dark-base16	'',heetch-light-base16	'',helios-base16	'',hemisu-dark-gogh	'',hemisu-light-gogh	'',highway	'',hipster-green	'',hivacruz	'',homebrew	'',hopscotch	'',hopscotch256	'',horizon-bright-gogh	'',horizon-dark-gogh	'',horizon-dark-base16	'',horizon-light-base16	'',humanoid-dark-base16	'',humanoid-light-base16	'',hurtado	'',hybrid	'',hybrid-gogh	'',hybrid-terminal-sexy	'',ic-green-ppl	'',ic-orange-ppl	'',ir-black-base16	'',ir-black	'',ibm3270-high-contrast-gogh	'',ibm3270-gogh	'',ic-green-ppl-gogh	'',icy-dark-base16	'',iiamblack-terminal-sexy	'',insignificato-terminal-sexy	'',invisibone-terminal-sexy	'',ir-black-gogh	'',isotope-base16	'',isotope-light-terminal-sexy	'',ivory-dark-terminal-sexy	'',ivory-light-terminal-sexy	'',jwr-dark-terminal-sexy	'',jackie-brown	'',japanesque	'',jason-wryan-terminal-sexy	'',jellybeans	'',jetbrains-darcula	'',jup-gogh	'',kanagawa-gogh	'',kasugano-terminal-sexy	'',kibble	'',kimber-base16	'',kokuban-gogh	'',kolorit	'',konsol-s	'',lab-fox	'',laser	'',laserwave-gogh	'',later-this-evening	'',lavandula	'',light-white-terminal-sexy	'',liquidcarbon	'',liquidcarbontransparent	'',liquidcarbontransparentinverse	'',london-tube-base16	'',londontube-light-terminal-sexy	'',lost-woods-terminal-sexy	'',low-contrast-terminal-sexy	'',lumifoo-terminal-sexy	'',lunaria-dark-gogh	'',lunaria-eclipse-gogh	'',lunaria-light-gogh	'',macintosh-base16	'',maia-gogh	'',man-page	'',mar-gogh	'',mariana	'',marrakesh-base16	'',marrakesh-light-terminal-sexy	'',mashup-colors-terminal-sexy	'',materia-base16	'',material	'',material-gogh	'',material-base16	'',material-terminal-sexy	'',material-darker-base16	'',material-lighter-base16	'',material-palenight-base16	'',material-vivid-base16	'',materialdark	'',materialdarker	'',materialdesigncolors	'',materialocean	'',mathias	'',matrix-terminal-sexy	'',medallion	'',mellow-purple-base16	'',mexico-light-base16	'',mikado-terminal-sexy	'',mikazuki-terminal-sexy	'',mirage	'',misterioso	'',mocha-base16	'',mocha-light-terminal-sexy	'',modusoperandi	'',modusvivendi	'',molokai	'',molokai-gogh	'',monalisa	'',mono-terminal-sexy	'',mono-amber-gogh	'',mono-cyan-gogh	'',mono-green-gogh	'',mono-red-gogh	'',mono-theme-terminal-sexy	'',mono-white-gogh	'',mono-yellow-gogh	'',monokai-base16	'',monokai-light-terminal-sexy	'',monokai-terminal-sexy	'',monokai-dark-gogh	'',monokai-pro-gogh	'',monokai-pro-ristretto-gogh	'',monokai-remastered	'',monokai-soda	'',monokai-vivid	'',morada-gogh	'',mostly-bright-terminal-sexy	'',mountain-fuji	'',muse-terminal-sexy	'',n0tch2k	'',nancy-terminal-sexy	'',nature-suede-terminal-sexy	'',navy-and-ivory-terminal-sexy	'',nebula-base16	'',neon	'',neon-terminal-sexy	'',neon-night-gogh	'',neopolitan	'',nep-gogh	'',neutron	'',night3024	'',night-owl-gogh	'',night-owl-sh-light	'',nightlion-v1	'',nightlion-v2	'',nighty-gogh	'',nocturnal-winter	'',nova-base16	'',novel	'',nucolors-terminal-sexy	'',nudge-terminal-sexy	'',numix-darkest-terminal-sexy	'',obsidian	'',ocean	'',ocean-base16	'',ocean-light-terminal-sexy	'',ocean-dark-gogh	'',oceanicnext	'',oceanicmaterial	'',oceanicnext-base16	'',ollie	'',omni-gogh	'',one-dark-gogh	'',one-half-black-gogh	'',one-light-gogh	'',one-light-base16	'',onedark-base16	'',onehalfdark	'',onehalflight	'',operator-mono-dark	'',orangish-terminal-sexy	'',outrun-dark-base16	'',overnight-slumber	'',oxocarbon-dark	'',oxocarbon-light	'',palenighthc	'',palenight-gogh	'',pali-gogh	'',panda-gogh	'',pandora	'',panels-terminal-sexy	'',papercolor-dark-base16	'',papercolor-light-base16	'',papercolor-dark-gogh	'',papercolor-light-gogh	'',paraiso-light-terminal-sexy	'',paraiso-dark	'',parker-brothers-terminal-sexy	'',pasque-base16	'',pastel-white-terminal-sexy	'',paul-millr-gogh	'',paulmillr	'',pencildark	'',pencillight	'',peppermint	'',peppermint-gogh	'',phd-base16	'',phrak1-terminal-sexy	'',piatto-light	'',pico-base16	'',pixiefl-ss-gogh	'',pnevma	'',poimandres	'',poimandres-storm	'',pop-base16	'',popping-and-locking	'',porple-base16	'',powershell-gogh	'',predawn-gogh	'',pretty-and-pastel-terminal-sexy	'',pro	'',pro-light	'',pulp-terminal-sexy	'',purple-people-eater-gogh	'',purple-rain	'',purpledream-base16	'',qualia-base16	'',railscasts-base16	'',railscasts-light-terminal-sexy	'',rapture	'',rasi-terminal-sexy	'',raycast-dark	'',raycast-light	'',rebecca-base16	'',red-alert	'',red-phoenix-terminal-sexy	'',red-planet	'',red-sands	'',relaxed	'',retro	'',rezza-terminal-sexy	'',rippedcasts	'',rose-pine	'',rose-pine-dawn	'',rose-pine-moon	'',rouge2	'',royal	'',rydgel-terminal-sexy	'',ryuuko	'',sos-terminal-sexy	'',sagelight-base16	'',sakura	'',sakura-base16	'',sandcastle-base16	'',sat-gogh	'',scarlet-protocol	'',seashel-s	'',seafoam-pastel	'',sequoia-monochrome	'',sequoia-moonlight	'',seti	'',seti-ui-base16	'',sex-colors-terminal-sexy	'',shades-of-purple-base16	'',shaman	'',shapeshifter-base16	'',shapeshifter-dark-terminal-sexy	'',shapeshifter-light-terminal-sexy	'',shel-gogh	'',shic-terminal-sexy	'',silk-dark-base16	'',silk-light-base16	'',simple-rainbow-terminal-sexy	'',slate	'',sleepyhollow	'',smyck	'',smyck-gogh	'',snazzy	'',snazzy-gogh	'',snazzy-base16	'',softserver	'',solar-flare-base16	'',solar-flare-light-base16	'',solarized-dark-terminal-sexy	'',solarized-light-terminal-sexy	'',solarized-darcula	'',solarized-dark-gogh	'',solarized-dark-patched	'',solarized-dark-higher-contrast	'',sonokai-gogh	'',spacegray	'',spacegray-eighties	'',spacegray-eighties-dull	'',spacedust	'',spacemacs-base16	'',spiderman	'',splurge-terminal-sexy	'',spring	'',spring-gogh	'',square	'',square-gogh	'',srcery-gogh	'',sublette	'',subliminal	'',summer-pop-gogh	'',summerfruit-dark-base16	'',summerfruit-light-base16	'',sundried	'',swayr-terminal-sexy	'',sweet-eliverlara-gogh	'',sweet-love-terminal-sexy	'',sweet-terminal-gogh	'',symfonic	'',synth-midnight-terminal-dark-base16	'',synth-midnight-terminal-light-base16	'',synthwave-gogh	'',synthwave-alpha-gogh	'',synthwavealpha	'',tango-base16	'',tango-terminal-sexy	'',tango-adapted	'',tango-half-adapted	'',tangoesque-terminal-sexy	'',tartan-terminal-sexy	'',teerb	'',tender-gogh	'',terminal-basic	'',terminix-dark-gogh	'',teva-terminal-sexy	'',thayer-bright	'',the-hulk	'',tin-gogh	'',tinacious-design-dark	'',tinacious-design-light	'',tokyo-night-gogh	'',tokyo-night-light-gogh	'',tokyo-night-storm-gogh	'',tomorrow	'',tomorrow-gogh	'',tomorrow-dark-terminal-sexy	'',tomorrow-light-terminal-sexy	'',tomorrow-night	'',tomorrow-night-gogh	'',tomorrow-night-blue	'',tomorrow-night-blue-gogh	'',tomorrow-night-bright	'',tomorrow-night-bright-gogh	'',tomorrow-night-burns	'',tomorrow-night-eighties	'',tomorrow-night-eighties-gogh	'',toychest	'',treehouse	'',trim-yer-beard-terminal-sexy	'',twilight	'',twilight-base16	'',twilight-light-terminal-sexy	'',ubuntu	'',ultradark	'',ultraviolent	'',underthesea	'',unikitty	'',unikitty-dark-base16	'',unikitty-light-base16	'',unikitty-reversible-base16	'',unsifted-wheat-terminal-sexy	'',ura-gogh	'',urple	'',vwbug-terminal-sexy	'',vacuous2-terminal-sexy	'',vag-gogh	'',vaughn	'',vibrantink	'',vice-alt-base16	'',vice-dark-base16	'',violet-dark	'',violet-light	'',visiblue-terminal-sexy	'',visibone-terminal-sexy	'',visibone-alt2-terminal-sexy	'',vs-code-dark-plus-gogh	'',vs-code-light-plus-gogh	'',warmneon	'',wez	'',whimsy	'',wildcherry	'',windows10-base16	'',windows10-light-base16	'',windows95-base16	'',windows95-light-base16	'',windows-high-contrast-base16	'',windows-high-contrast-light-base16	'',windows-nt-base16	'',windows-nt-light-base16	'',wombat	'',woodland-base16	'',wryan	'',wzoreck-gogh	'',x-dotshare-terminal-sexy	'',x-erosion-terminal-sexy	'',xcode-dusk-base16	'',yousai-terminal-sexy	'',zenburn	'',zenburn-base16	'',aikofog-terminal-sexy	'',arcoiris	'',astromouse-terminal-sexy	'',ayu	'',ayu-light	'',carbonfox	'',coffee-theme	'',cyberpunk	'',darkermatrix	'',darkmatrix	'',darkmoss-base16	'',dawnfox	'',dayfox	'',deep	'',dirtysea-base16	'',duckbones	'',duskfox	'',hund-terminal-sexy	'',icebergdark	'',iceberglight	'',idea	'',idletoes	'',jmbi-terminal-sexy	'',jubi	'',kanagawabones	'',lovelace	'',matrix	'',midnightinmojave	'',neobones-dark	'',neobones-light	'',nightfox	'',nord	'',nordfox	'',pinky-base16	'',primary	'',purplepeter	'',rebecca	'',s3r0-modified-terminal-sexy	'',seoulbones-dark	'',seoulbones-light	'',shadesofpurple	'',summercamp-base16	'',synthwave	'',synthwaveeverything	'',tender-base16	'',terafox	'',theme2-terminal-sexy	'',thwump-terminal-sexy	'',tlh-terminal-sexy	'',tokyonight-day	'',tokyonight-moon	'',tokyonight-night	'',tokyonight-storm	'',vimbones	'',vulcan-base16	'',wilmersdorf	'',zenbones	'',zenbones-dark	'',zenburn-terminal-sexy	'',zenburned	'',zenwritten-dark	'',zenwritten-light	''}"
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s l -l level -d 'Hald level (ex: 8 = 512x512 image)' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s a -l algorithm -d 'Algorithm to remap the LUT with' -r -f -a "{shepards-method	'Shepard\'s method (RBF interpolation using the inverse distance function). Params: --power, --nearest, --lum',gaussian-rbf	'Radial Basis Function interpolation using the Gaussian function. Params: --shape, --nearest, --lum',linear-rbf	'Radial Basis Function interpolation using a linear function. Params: --nearest, --lum',gaussian-sampling	'Optimized version of the original ImageMagick approach which applies gaussian noise to each color and averages nearest neighbors together. Params: --mean, --std_dev, --iterations, --lum',nearest-neighbor	'Simple, non-interpolated, nearest neighbor alorithm. Params: --lum'}"
complete -c lutgen -n "__fish_seen_subcommand_from generate" -l lum -d 'Luminosity factor for all algorithms. Used for weighting the luminosity vs color channels when computing color distances' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s n -l nearest -d 'Number of nearest palette colors to consider at any given time for RBF based algorithms. 0 uses unlimited (all) colors' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s s -l shape -d 'Gaussian RBF\'s shape parameter. Higher means less gradient between colors, lower mean more' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -l power -d 'Shepard algorithm\'s power parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s m -l mean -d 'Gaussian sampling algorithm\'s mean parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -l std-dev -d 'Gaussian sampling algorithm\'s standard deviation parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s i -l iterations -d 'Gaussian sampling algorithm\'s target number of samples to take for each color' -r
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s o -l output -d 'Path to write output to' -r -F
complete -c lutgen -n "__fish_seen_subcommand_from generate" -l preserve -d 'Preserve the original luminosity values for the output colors for RBF based algorithms. The luminosity factor is still used for distance computations'
complete -c lutgen -n "__fish_seen_subcommand_from generate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s o -l output -d 'Optional path to write output to. For multiple files, the output will be under a folder' -r -F
complete -c lutgen -n "__fish_seen_subcommand_from apply" -l hald-clut -d 'An external hald-clut to use. Conflicts with all lut generation related arguments' -r -F
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s p -l palette -d 'Predefined popular color palettes. Use `lutgen -p` to view all options. Compatible with custom colors' -r -f -a "{abernathy	'',aci-gogh	'',aco-gogh	'',adventure	'',adventuretime	'',afterglow	'',afterglow-gogh	'',alabaster	'',alienblood	'',andromeda	'',apathy-base16	'',apple-classic	'',apprentice-base16	'',argonaut	'',arthur	'',ashes-base16	'',ashes-light-terminal-sexy	'',atelier-cave-base16	'',atelier-cave-light-base16	'',atelier-dune-base16	'',atelier-dune-light-base16	'',atelier-estuary-base16	'',atelier-estuary-light-base16	'',atelier-forest-base16	'',atelier-forest-light-base16	'',atelier-heath-base16	'',atelier-heath-light-base16	'',atelier-lakeside-base16	'',atelier-lakeside-light-base16	'',atelier-plateau-base16	'',atelier-plateau-light-base16	'',atelier-savanna-base16	'',atelier-savanna-light-base16	'',atelier-seaside-base16	'',atelier-seaside-light-base16	'',atelier-sulphurpool-base16	'',atelier-sulphurpool-light-base16	'',ateliersulphurpool	'',atelierdune-dark-terminal-sexy	'',atelierdune-light-terminal-sexy	'',atelierforest-dark-terminal-sexy	'',atelierforest-light-terminal-sexy	'',atelierheath-dark-terminal-sexy	'',atelierheath-light-terminal-sexy	'',atelierlakeside-dark-terminal-sexy	'',atelierlakeside-light-terminal-sexy	'',atelierseaside-dark-terminal-sexy	'',atelierseaside-light-terminal-sexy	'',atlas-base16	'',atom	'',atomonelight	'',aura-gogh	'',aurora	'',ayu-dark-gogh	'',ayu-light-gogh	'',ayu-mirage	'',ayu-mirage-gogh	'',azu-gogh	'',banana-blueberry	'',batman	'',belafonte-day	'',belafonte-night	'',belge-terminal-sexy	'',bespin-base16	'',bespin-light-terminal-sexy	'',bim-gogh	'',birdsofparadise	'',biscuit-dark	'',biscuit-light	'',bitmute-terminal-sexy	'',black-metal-bathory-base16	'',black-metal-burzum-base16	'',black-metal-dark-funeral-base16	'',black-metal-gorgoroth-base16	'',black-metal-immortal-base16	'',black-metal-khold-base16	'',black-metal-marduk-base16	'',black-metal-mayhem-base16	'',black-metal-nile-base16	'',black-metal-venom-base16	'',black-metal-base16	'',blazer	'',bleh1-terminal-sexy	'',blue-matrix	'',blueberrypie	'',bluedolphin	'',bluloco-light-gogh	'',bluloco-zsh-light-gogh	'',blulocodark	'',blulocolight	'',borland	'',breath-gogh	'',breath-darker-gogh	'',breath-light-gogh	'',breath-silverfox-gogh	'',breeze	'',breeze-gogh	'',brewer-base16	'',brewer-light-terminal-sexy	'',bright-base16	'',bright-lights	'',broadcast	'',brogrammer	'',brogrammer-base16	'',brush-trees-base16	'',brush-trees-dark-base16	'',builtin-dark	'',builtin-light	'',builtin-pastel-dark	'',builtin-solarized-dark	'',builtin-solarized-light	'',builtin-tango-dark	'',builtin-tango-light	'',c64	'',cga	'',clrs	'',cai-gogh	'',calamity	'',canvased-pastel-terminal-sexy	'',carburetor	'',carburetor-cool	'',carburetor-warm	'',catch-me-if-you-can-terminal-sexy	'',catppuccin-frappe	'',catppuccin-latte	'',catppuccin-macchiato	'',catppuccin-mocha	'',catppuccin-oled	'',chalk	'',chalk-gogh	'',chalk-base16	'',chalk-light-terminal-sexy	'',chalkboard	'',challengerdeep	'',chameleon-gogh	'',chester	'',ciapre	'',circus-base16	'',city-streets-terminal-sexy	'',classic-dark-base16	'',classic-light-base16	'',clone-of-ubuntu-gogh	'',cloud-terminal-sexy	'',cobalt-neon	'',cobalt2	'',codeschool-base16	'',codeschool-light-terminal-sexy	'',color-star-terminal-sexy	'',colorcli-gogh	'',colorful-colors-terminal-sexy	'',colors-base16	'',count-von-count-terminal-sexy	'',crayonponyfish	'',cupcake-base16	'',cupertino-base16	'',cyberdyne	'',dwm-rob-terminal-sexy	'',danqing-base16	'',danqing-light-base16	'',darcula-base16	'',dark-ocean-terminal-sexy	'',dark-pastel	'',dark-plus	'',dark-violet-base16	'',darkside	'',darktooth-base16	'',dawn-terminal-sexy	'',day3024	'',deafened-terminal-sexy	'',decaf-base16	'',default-light-terminal-sexy	'',default-dark-base16	'',default-light-base16	'',dehydration-gogh	'',derp-terminal-sexy	'',desert	'',digerati-terminal-sexy	'',dimmedmonokai	'',dissonance-gogh	'',django	'',djangorebornagain	'',djangosmooth	'',doom-peacock	'',doomone	'',dotgov	'',dotshare-terminal-sexy	'',dracula	'',duotone-dark	'',encom	'',earthsong	'',edge-dark-base16	'',edge-light-base16	'',efautumn	'',efbio	'',efcherie	'',efdark	'',efspring	'',efsummer	'',eftriodark	'',eftriolight	'',eftritanopiadark	'',efwinter	'',eighties-base16	'',eighties-light-terminal-sexy	'',eldorado-dark-terminal-sexy	'',elemental	'',elementary	'',elementary-gogh	'',elic-gogh	'',elio-gogh	'',embers-base16	'',embers-light-terminal-sexy	'',epiphany-terminal-sexy	'',eqie6-terminal-sexy	'',equilibrium-dark-base16	'',equilibrium-gray-dark-base16	'',equilibrium-gray-light-base16	'',equilibrium-light-base16	'',erebus-terminal-sexy	'',espresso	'',espresso-base16	'',espresso-libre	'',euphrasia-terminal-sexy	'',eva-base16	'',eva-dim-base16	'',everblush	'',everforest-dark-gogh	'',everforest-light-gogh	'',fahrenheit	'',fairy-fl-ss-gogh	'',fairy-fl-ss-dark-gogh	'',fairyfl-ss	'',farside-terminal-sexy	'',fideloper	'',firefoxdev	'',firewatch	'',fishtank	'',fishbone-terminal-sexy	'',flat	'',flat-gogh	'',flat-base16	'',flat-remix-gogh	'',flatland	'',floraverse	'',forestblue	'',foxnightly-gogh	'',framer	'',framer-base16	'',freya-gogh	'',frontenddelight	'',fruit-soda-base16	'',funforrest	'',gjm-terminal-sexy	'',galaxy	'',galizur	'',geohot-gogh	'',gigavolt-base16	'',github-dark	'',github	'',github-base16	'',glacier	'',gogh-gogh	'',gooey-gogh	'',google-light-terminal-sexy	'',google-dark-gogh	'',google-dark-base16	'',google-light-gogh	'',google-light-base16	'',gotham-gogh	'',grandshell-terminal-sexy	'',grape	'',grass	'',grayscale-light-terminal-sexy	'',grayscale-dark-base16	'',grayscale-light-base16	'',green-screen-base16	'',greenscreen-light-terminal-sexy	'',greygreen	'',gruber-base16	'',gruvbox-dark	'',gruvbox-dark-hard	'',gruvbox-dark-soft	'',gruvbox-light	'',gruvbox-light-hard	'',gruvbox-light-soft	'',guezwhoz	'',hax0r-blue	'',hax0r-gr33n	'',hax0r-r3d	'',hacktober	'',hardcore	'',hardcore-base16	'',harmonic16-dark-base16	'',harmonic16-light-base16	'',harper	'',heetch-dark-base16	'',heetch-light-base16	'',helios-base16	'',hemisu-dark-gogh	'',hemisu-light-gogh	'',highway	'',hipster-green	'',hivacruz	'',homebrew	'',hopscotch	'',hopscotch256	'',horizon-bright-gogh	'',horizon-dark-gogh	'',horizon-dark-base16	'',horizon-light-base16	'',humanoid-dark-base16	'',humanoid-light-base16	'',hurtado	'',hybrid	'',hybrid-gogh	'',hybrid-terminal-sexy	'',ic-green-ppl	'',ic-orange-ppl	'',ir-black-base16	'',ir-black	'',ibm3270-high-contrast-gogh	'',ibm3270-gogh	'',ic-green-ppl-gogh	'',icy-dark-base16	'',iiamblack-terminal-sexy	'',insignificato-terminal-sexy	'',invisibone-terminal-sexy	'',ir-black-gogh	'',isotope-base16	'',isotope-light-terminal-sexy	'',ivory-dark-terminal-sexy	'',ivory-light-terminal-sexy	'',jwr-dark-terminal-sexy	'',jackie-brown	'',japanesque	'',jason-wryan-terminal-sexy	'',jellybeans	'',jetbrains-darcula	'',jup-gogh	'',kanagawa-gogh	'',kasugano-terminal-sexy	'',kibble	'',kimber-base16	'',kokuban-gogh	'',kolorit	'',konsol-s	'',lab-fox	'',laser	'',laserwave-gogh	'',later-this-evening	'',lavandula	'',light-white-terminal-sexy	'',liquidcarbon	'',liquidcarbontransparent	'',liquidcarbontransparentinverse	'',london-tube-base16	'',londontube-light-terminal-sexy	'',lost-woods-terminal-sexy	'',low-contrast-terminal-sexy	'',lumifoo-terminal-sexy	'',lunaria-dark-gogh	'',lunaria-eclipse-gogh	'',lunaria-light-gogh	'',macintosh-base16	'',maia-gogh	'',man-page	'',mar-gogh	'',mariana	'',marrakesh-base16	'',marrakesh-light-terminal-sexy	'',mashup-colors-terminal-sexy	'',materia-base16	'',material	'',material-gogh	'',material-base16	'',material-terminal-sexy	'',material-darker-base16	'',material-lighter-base16	'',material-palenight-base16	'',material-vivid-base16	'',materialdark	'',materialdarker	'',materialdesigncolors	'',materialocean	'',mathias	'',matrix-terminal-sexy	'',medallion	'',mellow-purple-base16	'',mexico-light-base16	'',mikado-terminal-sexy	'',mikazuki-terminal-sexy	'',mirage	'',misterioso	'',mocha-base16	'',mocha-light-terminal-sexy	'',modusoperandi	'',modusvivendi	'',molokai	'',molokai-gogh	'',monalisa	'',mono-terminal-sexy	'',mono-amber-gogh	'',mono-cyan-gogh	'',mono-green-gogh	'',mono-red-gogh	'',mono-theme-terminal-sexy	'',mono-white-gogh	'',mono-yellow-gogh	'',monokai-base16	'',monokai-light-terminal-sexy	'',monokai-terminal-sexy	'',monokai-dark-gogh	'',monokai-pro-gogh	'',monokai-pro-ristretto-gogh	'',monokai-remastered	'',monokai-soda	'',monokai-vivid	'',morada-gogh	'',mostly-bright-terminal-sexy	'',mountain-fuji	'',muse-terminal-sexy	'',n0tch2k	'',nancy-terminal-sexy	'',nature-suede-terminal-sexy	'',navy-and-ivory-terminal-sexy	'',nebula-base16	'',neon	'',neon-terminal-sexy	'',neon-night-gogh	'',neopolitan	'',nep-gogh	'',neutron	'',night3024	'',night-owl-gogh	'',night-owl-sh-light	'',nightlion-v1	'',nightlion-v2	'',nighty-gogh	'',nocturnal-winter	'',nova-base16	'',novel	'',nucolors-terminal-sexy	'',nudge-terminal-sexy	'',numix-darkest-terminal-sexy	'',obsidian	'',ocean	'',ocean-base16	'',ocean-light-terminal-sexy	'',ocean-dark-gogh	'',oceanicnext	'',oceanicmaterial	'',oceanicnext-base16	'',ollie	'',omni-gogh	'',one-dark-gogh	'',one-half-black-gogh	'',one-light-gogh	'',one-light-base16	'',onedark-base16	'',onehalfdark	'',onehalflight	'',operator-mono-dark	'',orangish-terminal-sexy	'',outrun-dark-base16	'',overnight-slumber	'',oxocarbon-dark	'',oxocarbon-light	'',palenighthc	'',palenight-gogh	'',pali-gogh	'',panda-gogh	'',pandora	'',panels-terminal-sexy	'',papercolor-dark-base16	'',papercolor-light-base16	'',papercolor-dark-gogh	'',papercolor-light-gogh	'',paraiso-light-terminal-sexy	'',paraiso-dark	'',parker-brothers-terminal-sexy	'',pasque-base16	'',pastel-white-terminal-sexy	'',paul-millr-gogh	'',paulmillr	'',pencildark	'',pencillight	'',peppermint	'',peppermint-gogh	'',phd-base16	'',phrak1-terminal-sexy	'',piatto-light	'',pico-base16	'',pixiefl-ss-gogh	'',pnevma	'',poimandres	'',poimandres-storm	'',pop-base16	'',popping-and-locking	'',porple-base16	'',powershell-gogh	'',predawn-gogh	'',pretty-and-pastel-terminal-sexy	'',pro	'',pro-light	'',pulp-terminal-sexy	'',purple-people-eater-gogh	'',purple-rain	'',purpledream-base16	'',qualia-base16	'',railscasts-base16	'',railscasts-light-terminal-sexy	'',rapture	'',rasi-terminal-sexy	'',raycast-dark	'',raycast-light	'',rebecca-base16	'',red-alert	'',red-phoenix-terminal-sexy	'',red-planet	'',red-sands	'',relaxed	'',retro	'',rezza-terminal-sexy	'',rippedcasts	'',rose-pine	'',rose-pine-dawn	'',rose-pine-moon	'',rouge2	'',royal	'',rydgel-terminal-sexy	'',ryuuko	'',sos-terminal-sexy	'',sagelight-base16	'',sakura	'',sakura-base16	'',sandcastle-base16	'',sat-gogh	'',scarlet-protocol	'',seashel-s	'',seafoam-pastel	'',sequoia-monochrome	'',sequoia-moonlight	'',seti	'',seti-ui-base16	'',sex-colors-terminal-sexy	'',shades-of-purple-base16	'',shaman	'',shapeshifter-base16	'',shapeshifter-dark-terminal-sexy	'',shapeshifter-light-terminal-sexy	'',shel-gogh	'',shic-terminal-sexy	'',silk-dark-base16	'',silk-light-base16	'',simple-rainbow-terminal-sexy	'',slate	'',sleepyhollow	'',smyck	'',smyck-gogh	'',snazzy	'',snazzy-gogh	'',snazzy-base16	'',softserver	'',solar-flare-base16	'',solar-flare-light-base16	'',solarized-dark-terminal-sexy	'',solarized-light-terminal-sexy	'',solarized-darcula	'',solarized-dark-gogh	'',solarized-dark-patched	'',solarized-dark-higher-contrast	'',sonokai-gogh	'',spacegray	'',spacegray-eighties	'',spacegray-eighties-dull	'',spacedust	'',spacemacs-base16	'',spiderman	'',splurge-terminal-sexy	'',spring	'',spring-gogh	'',square	'',square-gogh	'',srcery-gogh	'',sublette	'',subliminal	'',summer-pop-gogh	'',summerfruit-dark-base16	'',summerfruit-light-base16	'',sundried	'',swayr-terminal-sexy	'',sweet-eliverlara-gogh	'',sweet-love-terminal-sexy	'',sweet-terminal-gogh	'',symfonic	'',synth-midnight-terminal-dark-base16	'',synth-midnight-terminal-light-base16	'',synthwave-gogh	'',synthwave-alpha-gogh	'',synthwavealpha	'',tango-base16	'',tango-terminal-sexy	'',tango-adapted	'',tango-half-adapted	'',tangoesque-terminal-sexy	'',tartan-terminal-sexy	'',teerb	'',tender-gogh	'',terminal-basic	'',terminix-dark-gogh	'',teva-terminal-sexy	'',thayer-bright	'',the-hulk	'',tin-gogh	'',tinacious-design-dark	'',tinacious-design-light	'',tokyo-night-gogh	'',tokyo-night-light-gogh	'',tokyo-night-storm-gogh	'',tomorrow	'',tomorrow-gogh	'',tomorrow-dark-terminal-sexy	'',tomorrow-light-terminal-sexy	'',tomorrow-night	'',tomorrow-night-gogh	'',tomorrow-night-blue	'',tomorrow-night-blue-gogh	'',tomorrow-night-bright	'',tomorrow-night-bright-gogh	'',tomorrow-night-burns	'',tomorrow-night-eighties	'',tomorrow-night-eighties-gogh	'',toychest	'',treehouse	'',trim-yer-beard-terminal-sexy	'',twilight	'',twilight-base16	'',twilight-light-terminal-sexy	'',ubuntu	'',ultradark	'',ultraviolent	'',underthesea	'',unikitty	'',unikitty-dark-base16	'',unikitty-light-base16	'',unikitty-reversible-base16	'',unsifted-wheat-terminal-sexy	'',ura-gogh	'',urple	'',vwbug-terminal-sexy	'',vacuous2-terminal-sexy	'',vag-gogh	'',vaughn	'',vibrantink	'',vice-alt-base16	'',vice-dark-base16	'',violet-dark	'',violet-light	'',visiblue-terminal-sexy	'',visibone-terminal-sexy	'',visibone-alt2-terminal-sexy	'',vs-code-dark-plus-gogh	'',vs-code-light-plus-gogh	'',warmneon	'',wez	'',whimsy	'',wildcherry	'',windows10-base16	'',windows10-light-base16	'',windows95-base16	'',windows95-light-base16	'',windows-high-contrast-base16	'',windows-high-contrast-light-base16	'',windows-nt-base16	'',windows-nt-light-base16	'',wombat	'',woodland-base16	'',wryan	'',wzoreck-gogh	'',x-dotshare-terminal-sexy	'',x-erosion-terminal-sexy	'',xcode-dusk-base16	'',yousai-terminal-sexy	'',zenburn	'',zenburn-base16	'',aikofog-terminal-sexy	'',arcoiris	'',astromouse-terminal-sexy	'',ayu	'',ayu-light	'',carbonfox	'',coffee-theme	'',cyberpunk	'',darkermatrix	'',darkmatrix	'',darkmoss-base16	'',dawnfox	'',dayfox	'',deep	'',dirtysea-base16	'',duckbones	'',duskfox	'',hund-terminal-sexy	'',icebergdark	'',iceberglight	'',idea	'',idletoes	'',jmbi-terminal-sexy	'',jubi	'',kanagawabones	'',lovelace	'',matrix	'',midnightinmojave	'',neobones-dark	'',neobones-light	'',nightfox	'',nord	'',nordfox	'',pinky-base16	'',primary	'',purplepeter	'',rebecca	'',s3r0-modified-terminal-sexy	'',seoulbones-dark	'',seoulbones-light	'',shadesofpurple	'',summercamp-base16	'',synthwave	'',synthwaveeverything	'',tender-base16	'',terafox	'',theme2-terminal-sexy	'',thwump-terminal-sexy	'',tlh-terminal-sexy	'',tokyonight-day	'',tokyonight-moon	'',tokyonight-night	'',tokyonight-storm	'',vimbones	'',vulcan-base16	'',wilmersdorf	'',zenbones	'',zenbones-dark	'',zenburn-terminal-sexy	'',zenburned	'',zenwritten-dark	'',zenwritten-light	''}"
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s l -l level -d 'Hald level (ex: 8 = 512x512 image)' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s a -l algorithm -d 'Algorithm to remap the LUT with' -r -f -a "{shepards-method	'Shepard\'s method (RBF interpolation using the inverse distance function). Params: --power, --nearest, --lum',gaussian-rbf	'Radial Basis Function interpolation using the Gaussian function. Params: --shape, --nearest, --lum',linear-rbf	'Radial Basis Function interpolation using a linear function. Params: --nearest, --lum',gaussian-sampling	'Optimized version of the original ImageMagick approach which applies gaussian noise to each color and averages nearest neighbors together. Params: --mean, --std_dev, --iterations, --lum',nearest-neighbor	'Simple, non-interpolated, nearest neighbor alorithm. Params: --lum'}"
complete -c lutgen -n "__fish_seen_subcommand_from apply" -l lum -d 'Luminosity factor for all algorithms. Used for weighting the luminosity vs color channels when computing color distances' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s n -l nearest -d 'Number of nearest palette colors to consider at any given time for RBF based algorithms. 0 uses unlimited (all) colors' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s s -l shape -d 'Gaussian RBF\'s shape parameter. Higher means less gradient between colors, lower mean more' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -l power -d 'Shepard algorithm\'s power parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s m -l mean -d 'Gaussian sampling algorithm\'s mean parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -l std-dev -d 'Gaussian sampling algorithm\'s standard deviation parameter' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s i -l iterations -d 'Gaussian sampling algorithm\'s target number of samples to take for each color' -r
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s c -l cache -d 'Enable caching the generated LUT'
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s f -l force -d 'Force overwriting the cached LUT'
complete -c lutgen -n "__fish_seen_subcommand_from apply" -l preserve -d 'Preserve the original luminosity values for the output colors for RBF based algorithms. The luminosity factor is still used for distance computations'
complete -c lutgen -n "__fish_seen_subcommand_from apply" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c lutgen -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c lutgen -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from generate; and not __fish_seen_subcommand_from apply; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from help" -f -a "generate" -d 'Generate a hald clut for external or manual usage'
complete -c lutgen -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from generate; and not __fish_seen_subcommand_from apply; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from help" -f -a "apply" -d 'Correct an image using a hald clut, either generating it, or loading it externally'
complete -c lutgen -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from generate; and not __fish_seen_subcommand_from apply; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from help" -f -a "completions" -d 'Generate shell completions'
complete -c lutgen -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from generate; and not __fish_seen_subcommand_from apply; and not __fish_seen_subcommand_from completions; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
