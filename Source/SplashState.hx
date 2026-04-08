import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxTimer;

class SplashState extends FlxState
{
	static inline var MIN_SECONDS:Float = 2.5;
	static inline var LOGO_PATH:String = "assets/images/UI/StudioLogo.png";

	var done:Bool = false;
	
	override public function create():Void
	{
		super.create();
		var studiologo = new FlxSprite(0, 0, LOGO_PATH);
		studiologo.scale.set(2, 2);
		studiologo.screenCenter();
		add(studiologo);

		new FlxTimer().start(MIN_SECONDS, function(_:FlxTimer):Void {
			goNext();
		});
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.SPACE || FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.ENTER || FlxG.mouse.justPressed)
			goNext();
	}
	function goNext():Void
	{
		if (done) return;
		done = true;
		FlxG.switchState(MenuState.new);
	}
}