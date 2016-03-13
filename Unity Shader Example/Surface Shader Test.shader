Shader "Custom/Surface Shader Test" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Glossiness ("Smoothness", Range(0,1)) = 0.5
		_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
//		Tags { "RenderType"="Opaque" }
		Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }

		Lighting On
        ZWrite On
        Cull Back
		Blend SrcAlpha OneMinusSrcAlpha
    	Cull Off
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard addshadow fullforwardshadows alpha

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;
		fixed4 _Color;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			float4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

//			o.Albedo = c.rgb;

			float2 st = IN.uv_MainTex;

			st *= 80;
			st = frac(st);

			float distanceSquare = pow(st.x - 0.5, 2) + pow(st.y - 0.5, 2);

			float radius = abs(cos(_Time.y) * 0.25);

			float albedo = smoothstep(0, radius, radius - distanceSquare);

			o.Albedo = float3(albedo, albedo, albedo);
			o.Alpha = 1.0;

			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
