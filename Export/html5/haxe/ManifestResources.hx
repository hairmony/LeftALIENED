package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:pathy30:assets%2Fimages%2FAsteroid.pngy4:sizei4465y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y26:assets%2Fimages%2FBoss.pngR2i8970R3R4R5R7R6tgoR0y27:assets%2Fimages%2FEnemy.pngR2i9657R3R4R5R8R6tgoR0y31:assets%2Fimages%2FEnemyIdle.pngR2i1741R3R4R5R9R6tgoR0y37:assets%2Fimages%2FLevelBackground.pngR2i391162R3R4R5R10R6tgoR0y36:assets%2Fimages%2FMenuBackground.pngR2i432369R3R4R5R11R6tgoR0y32:assets%2Fimages%2FProjectile.pngR2i240R3R4R5R12R6tgoR0y33:assets%2Fimages%2FProjectile2.pngR2i512R3R4R5R13R6tgoR0y33:assets%2Fimages%2FProjectile3.pngR2i645R3R4R5R14R6tgoR0y33:assets%2Fimages%2FProjectile4.pngR2i637R3R4R5R15R6tgoR0y34:assets%2Fimages%2FProjectileOG.pngR2i349R3R4R5R16R6tgoR0y26:assets%2Fimages%2FShip.pngR2i1532R3R4R5R17R6tgoR0y27:assets%2Fimages%2FShip2.pngR2i1390R3R4R5R18R6tgoR0y27:assets%2Fimages%2FShip3.pngR2i1146R3R4R5R19R6tgoR0y27:assets%2Fimages%2FShip4.pngR2i1742R3R4R5R20R6tgoR0y27:assets%2Fimages%2FShip5.pngR2i315R3R4R5R21R6tgoR0y27:assets%2Fimages%2FShip6.pngR2i2081R3R4R5R22R6tgoR0y28:assets%2Fimages%2FSlider.pngR2i402R3R4R5R23R6tgoR0y31:assets%2Fimages%2FUI%2FLogo.pngR2i6599R3R4R5R24R6tgoR0y37:assets%2Fimages%2FUI%2FStudioLogo.pngR2i645R3R4R5R25R6tgoR2i1895303R3y5:MUSICR5y30:assets%2Fmusic%2FBossMusic.oggy9:pathGroupaR27hR6tgoR2i3042847R3R26R5y31:assets%2Fmusic%2FLevelMusic.oggR28aR29hR6tgoR2i2412115R3R26R5y32:assets%2Fmusic%2FLevelMusic2.oggR28aR30hR6tgoR2i2892976R3R26R5y30:assets%2Fmusic%2FMenuMusic.oggR28aR31hR6tgoR2i31096R3y5:SOUNDR5y31:assets%2Fsounds%2FDeathBoss.oggR28aR33hR6tgoR2i17067R3R32R5y33:assets%2Fsounds%2FDeathEnemy2.oggR28aR34hR6tgoR2i15891R3R32R5y27:assets%2Fsounds%2FDodge.oggR28aR35hR6tgoR2i6418R3R32R5y37:assets%2Fsounds%2FExplodeAsteroid.oggR28aR36hR6tgoR2i7712R3R32R5y34:assets%2Fsounds%2FExplodeEnemy.oggR28aR37hR6tgoR2i23335R3R32R5y32:assets%2Fsounds%2FShootEnemy.oggR28aR38hR6tgoR2i8190R3R32R5y33:assets%2Fsounds%2FShootPlayer.oggR28aR39hR6tgoR2i10590R3R32R5y34:assets%2Fsounds%2FShootSpecial.oggR28aR40hR6tgoR2i8220R3R26R5y26:flixel%2Fsounds%2Fbeep.mp3R28aR41y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R26R5y28:flixel%2Fsounds%2Fflixel.mp3R28aR43y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i6840R3R32R5R42R28aR41R42hgoR2i33629R3R32R5R44R28aR43R44hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R45R46y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R4R5R51R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R4R5R52R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fcircle.pngR2i299R3R4R5R53R6tgoR0y53:flixel%2Fimages%2Ftransitions%2Fdiagonal_gradient.pngR2i730R3R4R5R54R6tgoR0y43:flixel%2Fimages%2Ftransitions%2Fdiamond.pngR2i236R3R4R5R55R6tgoR0y42:flixel%2Fimages%2Ftransitions%2Fsquare.pngR2i209R3R4R5R56R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_asteroid_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_boss_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemyidle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_levelbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_menubackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_projectile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_projectile2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_projectile3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_projectile4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_projectileog_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ship6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_slider_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ui_studiologo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_bossmusic_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_levelmusic_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_levelmusic2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_menumusic_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_deathboss_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_deathenemy2_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dodge_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_explodeasteroid_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_explodeenemy_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shootenemy_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shootplayer_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shootspecial_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("Assets/images/Asteroid.png") @:noCompletion #if display private #end class __ASSET__assets_images_asteroid_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Boss.png") @:noCompletion #if display private #end class __ASSET__assets_images_boss_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Enemy.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/EnemyIdle.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemyidle_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/LevelBackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_levelbackground_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/MenuBackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_menubackground_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Projectile.png") @:noCompletion #if display private #end class __ASSET__assets_images_projectile_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Projectile2.png") @:noCompletion #if display private #end class __ASSET__assets_images_projectile2_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Projectile3.png") @:noCompletion #if display private #end class __ASSET__assets_images_projectile3_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Projectile4.png") @:noCompletion #if display private #end class __ASSET__assets_images_projectile4_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/ProjectileOG.png") @:noCompletion #if display private #end class __ASSET__assets_images_projectileog_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship2.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship2_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship3.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship3_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship4.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship4_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship5.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship5_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Ship6.png") @:noCompletion #if display private #end class __ASSET__assets_images_ship6_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/Slider.png") @:noCompletion #if display private #end class __ASSET__assets_images_slider_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/UI/Logo.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_logo_png extends lime.graphics.Image {}
@:keep @:image("Assets/images/UI/StudioLogo.png") @:noCompletion #if display private #end class __ASSET__assets_images_ui_studiologo_png extends lime.graphics.Image {}
@:keep @:file("Assets/music/BossMusic.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_bossmusic_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/music/LevelMusic.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_levelmusic_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/music/LevelMusic2.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_levelmusic2_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/music/MenuMusic.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_menumusic_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/DeathBoss.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_deathboss_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/DeathEnemy2.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_deathenemy2_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/Dodge.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_dodge_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/ExplodeAsteroid.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_explodeasteroid_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/ExplodeEnemy.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_explodeenemy_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/ShootEnemy.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_shootenemy_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/ShootPlayer.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_shootplayer_ogg extends haxe.io.Bytes {}
@:keep @:file("Assets/sounds/ShootSpecial.ogg") @:noCompletion #if display private #end class __ASSET__assets_sounds_shootspecial_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("Export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("Export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/6,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/circle.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_circle_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diagonal_gradient.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diagonal_gradient_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/diamond.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_diamond_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel-addons/3,3,2/assets/images/transitions/square.png") @:noCompletion #if display private #end class __ASSET__flixel_images_transitions_square_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end