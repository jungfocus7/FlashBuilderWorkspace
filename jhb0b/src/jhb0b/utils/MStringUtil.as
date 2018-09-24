package jhb0b.utils
{
	public final class MStringUtil
	{
		//:: 문자열 데이터가 완전이 없지 여부
		public static function is_empty(v:String):Boolean
		{
			var rv:Boolean = false;

			if
			(
				(v == null) || (v == '') ||
				(v.split(' ').join('').length < 1)
			)
			{
				rv = true;
			}

			return rv;
		}

		//:: 토큰문자 개수만큼 채우기
		public static function add_token(tstr:String, count:int, token:String = '0'):String
		{
			var t_str:String = tstr;

			var t_l:int = count - t_str.length;
			var i:int = 0;
			while (i < t_l)
			{
				t_str = token + t_str;
				i++;
			}

			return t_str;
		}

		//::
		public static function rmfill(tstr:String, astr:String):String
		{
			var t_la:uint = tstr.length;
			var t_lb:uint = astr.length;
			if (t_la < t_lb)
			{
				var t_l:uint = t_lb - t_la;
				var t_nstr:String = astr.substr(0, t_l) + tstr;
				return t_nstr;
			}
			else
			{
				return tstr;
			}
		}

		//:: 문자열 앞,뒤 공백제거
		public static function clear_whiteSpace(tstr:String, type:String = 'be'):String
		{
			var t_rv:String = tstr;
			//var t_regBegin:RegExp = new RegExp('^\\s*');
			//var t_regEnd:RegExp = new RegExp('\\s*$');
			const t_regBegin:RegExp = /^\s+/;
			const t_regEnd:RegExp = /\s+$/;

			if (type == 'b')
			{
				t_rv = t_rv.replace(t_regBegin, '');
			}
			else
			if (type == 'e')
			{
				t_rv = t_rv.replace(t_regEnd, '');
			}
			else
			if (type == 'be')
			{
				t_rv = t_rv.replace(t_regBegin, '');
				t_rv = t_rv.replace(t_regEnd, '');
			}

			return t_rv;
		}

		//:: 문자열 치환
		public static function replace(tstr:String, oldStr:String, newStr:String):String
		{
			return tstr.split(oldStr).join(newStr);
		}



		//:: 라스트 인덱트 찾기
		public static function get_lastNum(name:String, token:String = '_'):int
		{
			var t_li:int = name.lastIndexOf(token) + 1;
			var t_rv:int = int(name.substr(t_li));
			return t_rv;
		}

		//:: 라스트 인덱트 찾기 2
		public static function get_lastNum2(name:String, step:uint = 0, token:String = '_'):int
		{
			var t_rv:int = -1;

			var t_fi:int = name.length - 1;
			var t_ti:int;
			var t_bi:int;
			var t_len:int;

			for (var i:uint = 0; i <= step; i ++)
			{
				t_ti = name.lastIndexOf(token, t_fi);

				if (t_ti > -1)
				{
					t_bi = t_ti + token.length;
					t_len = (t_fi - t_bi) + 1;
					t_fi = t_ti - 1;
				}
				else
				{
					t_bi = -1;
					break;
				}
			}

			if (t_bi > -1)
			{
				var t_numStr:String = name.substr(t_bi, t_len);
				var t_check:Number = Number(t_numStr);

				if (!isNaN(t_check))
				{
					t_rv = int(t_check);
				}
			}

			return t_rv;
		}


		//::
		public static function get_thisUrl(url:String):String
		{
			return decodeURIComponent(url);
		}

		//:: 현재 파일 이름만 반환
		public static function get_thisName(url:String, extStr:String = 'swf'):String
		{
			var t_rv:String = null;
			var t_si:int = url.lastIndexOf('/') + 1;
			var t_ei:int = url.lastIndexOf('.' + extStr);
			t_rv = url.substring(t_si, t_ei);

			return t_rv;
		}

		//:: LoaderInfo.url에서 절대 경로 반환하기
		public static function get_baseUrl(url:String):String
		{
			var t_rv:String = url;
			var t_li:int = t_rv.lastIndexOf('/') + 1;
			t_rv = t_rv.substring(0, t_li);

			return t_rv;
		}
	}
}