Shader "Custom/1_1color" {
	// 属性
	Properties {
	     //定义一个颜色
	    _golorr("Main Color",Color) = (1,.5,.5,1)
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_MainTex2("Tex2 (ARGB)",2D) = "white" {}
	}
	
	// 子shader
	SubShader {
		Pass{
			Material{
			//显示该颜色
				Diffuse[_golorr]
			}
			
			//打开光照开关，即接受光照
			Lighting On
			
			setTexture[_MainTex]
			{
			 //      第一张材质 * 顶点颜色
				Combine texture*primary
			}
			
			//      第二张材质 * 之前累积（这里即第一张材质）
			setTexture[_MainTex2]
			{
				Combine texture*previous
			}
		}	
	} 
	//FallBack "Diffuse"
}
