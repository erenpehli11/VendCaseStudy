; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [386 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1158 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 41
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 340
	i64 u0x0071cf2d27b7d61e, ; 2: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 289
	i64 u0x009c2f7bb59dcae4, ; 3: Xamarin.AndroidX.DataStore.Core.dll => 236
	i64 u0x00b0961fefccd32b, ; 4: Xamarin.Kotlin.Android.Extensions.Runtime.Library.dll => 332
	i64 u0x01109b0e4d99e61f, ; 5: System.ComponentModel.Annotations.dll => 13
	i64 u0x02123411c4e01926, ; 6: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 276
	i64 u0x022e81ea9c46e03a, ; 7: lib_CommunityToolkit.Maui.Core.dll.so => 174
	i64 u0x022f31be406de945, ; 8: Microsoft.Extensions.Options.ConfigurationExtensions => 193
	i64 u0x0284512fad379f7e, ; 9: System.Runtime.Handles => 104
	i64 u0x02abedc11addc1ed, ; 10: lib_Mono.Android.Runtime.dll.so => 170
	i64 u0x02d76a1c11b92fc8, ; 11: Xamarin.AndroidX.DataStore.Preferences.External.Protobuf.dll => 245
	i64 u0x02f55bf70672f5c8, ; 12: lib_System.IO.FileSystem.DriveInfo.dll.so => 47
	i64 u0x032267b2a94db371, ; 13: lib_Xamarin.AndroidX.AppCompat.dll.so => 215
	i64 u0x03621c804933a890, ; 14: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 15: lib_System.Private.DataContractSerialization.dll.so => 85
	i64 u0x043032f1d071fae0, ; 16: ru/Microsoft.Maui.Controls.resources => 371
	i64 u0x044440a55165631e, ; 17: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0x046eb1581a80c6b0, ; 18: vi/Microsoft.Maui.Controls.resources => 377
	i64 u0x047408741db2431a, ; 19: Xamarin.AndroidX.DynamicAnimation => 249
	i64 u0x0517ef04e06e9f76, ; 20: System.Net.Primitives => 70
	i64 u0x051a3be159e4ef99, ; 21: Xamarin.GooglePlayServices.Tasks => 328
	i64 u0x0565d18c6da3de38, ; 22: Xamarin.AndroidX.RecyclerView => 282
	i64 u0x0581db89237110e9, ; 23: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 24: Microsoft.Maui.dll => 197
	i64 u0x05a1c25e78e22d87, ; 25: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 101
	i64 u0x06076b5d2b581f08, ; 26: zh-HK/Microsoft.Maui.Controls.resources => 378
	i64 u0x06388ffe9f6c161a, ; 27: System.Xml.Linq.dll => 155
	i64 u0x06600c4c124cb358, ; 28: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 29: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 254
	i64 u0x0680a433c781bb3d, ; 30: Xamarin.AndroidX.Collection.Jvm => 222
	i64 u0x069fff96ec92a91d, ; 31: System.Xml.XPath.dll => 160
	i64 u0x070b0847e18dab68, ; 32: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 251
	i64 u0x0739448d84d3b016, ; 33: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 293
	i64 u0x07469f2eecce9e85, ; 34: mscorlib.dll => 166
	i64 u0x076d63b26e8c23aa, ; 35: lib_Xamarin.AndroidX.DataStore.Core.OkIO.dll.so => 239
	i64 u0x07c57877c7ba78ad, ; 36: ru/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0x07dcdc7460a0c5e4, ; 37: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 38: lib_Microsoft.Extensions.Logging.Debug.dll.so => 191
	i64 u0x088610fc2509f69e, ; 39: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 294
	i64 u0x08a7c865576bbde7, ; 40: System.Reflection.Primitives => 95
	i64 u0x08c9d051a4a817e5, ; 41: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 233
	i64 u0x08f3c9788ee2153c, ; 42: Xamarin.AndroidX.DrawerLayout => 248
	i64 u0x09138715c92dba90, ; 43: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 44: lib_Microsoft.Extensions.Options.dll.so => 192
	i64 u0x092266563089ae3e, ; 45: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x098b50f911ccea8d, ; 46: lib_Xamarin.GooglePlayServices.Basement.dll.so => 324
	i64 u0x09d144a7e214d457, ; 47: System.Security.Cryptography => 126
	i64 u0x09da6dfc3439e851, ; 48: lib_Xamarin.Firebase.Components.dll.so => 302
	i64 u0x09e2b9f743db21a8, ; 49: lib_System.Reflection.Metadata.dll.so => 94
	i64 u0x0aa3b5fea3a019cb, ; 50: Xamarin.AndroidX.DataStore.Preferences.Core.Jvm => 244
	i64 u0x0abb3e2b271edc45, ; 51: System.Threading.Channels.dll => 139
	i64 u0x0b06b1feab070143, ; 52: System.Formats.Tar => 38
	i64 u0x0b3b632c3bbee20c, ; 53: sk/Microsoft.Maui.Controls.resources => 372
	i64 u0x0b521223ae889727, ; 54: Xamarin.Firebase.Messaging => 311
	i64 u0x0b6aff547b84fbe9, ; 55: Xamarin.KotlinX.Serialization.Core.Jvm => 344
	i64 u0x0be2e1f8ce4064ed, ; 56: Xamarin.AndroidX.ViewPager => 296
	i64 u0x0c0d0f979b6020a3, ; 57: Xamarin.AndroidX.DataStore.Preferences.External.Protobuf => 245
	i64 u0x0c279376b1ae96ae, ; 58: lib_System.CodeDom.dll.so => 203
	i64 u0x0c3ca6cc978e2aae, ; 59: pt-BR/Microsoft.Maui.Controls.resources => 368
	i64 u0x0c59ad9fbbd43abe, ; 60: Mono.Android => 171
	i64 u0x0c65741e86371ee3, ; 61: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 209
	i64 u0x0c74af560004e816, ; 62: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 63: lib_Microsoft.Maui.Essentials.dll.so => 198
	i64 u0x0c83c82812e96127, ; 64: lib_System.Net.Mail.dll.so => 66
	i64 u0x0cce4bce83380b7f, ; 65: Xamarin.AndroidX.Security.SecurityCrypto => 286
	i64 u0x0d13cd7cce4284e4, ; 66: System.Security.SecureString => 129
	i64 u0x0d4e6ab61d0a0d40, ; 67: lib_Xamarin.AndroidX.DataStore.Core.OkIO.Jvm.dll.so => 240
	i64 u0x0e04e702012f8463, ; 68: Xamarin.AndroidX.Emoji2 => 250
	i64 u0x0e14e73a54dda68e, ; 69: lib_System.Net.NameResolution.dll.so => 67
	i64 u0x0e5f1ca7132adebb, ; 70: Xamarin.Firebase.Installations.dll => 308
	i64 u0x0f37dd7a62ae99af, ; 71: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 223
	i64 u0x0f5e7abaa7cf470a, ; 72: System.Net.HttpListener => 65
	i64 u0x1001f97bbe242e64, ; 73: System.IO.UnmanagedMemoryStream => 56
	i64 u0x102a31b45304b1da, ; 74: Xamarin.AndroidX.CustomView => 232
	i64 u0x1065c4cb554c3d75, ; 75: System.IO.IsolatedStorage.dll => 51
	i64 u0x10f6cfcbcf801616, ; 76: System.IO.Compression.Brotli => 42
	i64 u0x114443cdcf2091f1, ; 77: System.Security.Cryptography.Primitives => 124
	i64 u0x11a603952763e1d4, ; 78: System.Net.Mail => 66
	i64 u0x11a70d0e1009fb11, ; 79: System.Net.WebSockets.dll => 80
	i64 u0x11f26371eee0d3c1, ; 80: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 265
	i64 u0x11fbe62d469cc1c8, ; 81: Microsoft.VisualStudio.DesignTools.TapContract.dll => 383
	i64 u0x12128b3f59302d47, ; 82: lib_System.Xml.Serialization.dll.so => 157
	i64 u0x123639456fb056da, ; 83: System.Reflection.Emit.Lightweight.dll => 91
	i64 u0x124799f7d9fbc03f, ; 84: Xamarin.KotlinX.Serialization.Protobuf.Jvm.dll => 346
	i64 u0x12521e9764603eaa, ; 85: lib_System.Resources.Reader.dll.so => 98
	i64 u0x125b7f94acb989db, ; 86: Xamarin.AndroidX.RecyclerView.dll => 282
	i64 u0x127a8ad73b84ed96, ; 87: Xamarin.GooglePlayServices.Auth.Base.dll => 322
	i64 u0x12d3b63863d4ab0b, ; 88: lib_System.Threading.Overlapped.dll.so => 140
	i64 u0x134eab1061c395ee, ; 89: System.Transactions => 150
	i64 u0x138567fa954faa55, ; 90: Xamarin.AndroidX.Browser => 219
	i64 u0x13a01de0cbc3f06c, ; 91: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 355
	i64 u0x13beedefb0e28a45, ; 92: lib_System.Xml.XmlDocument.dll.so => 161
	i64 u0x13f1e5e209e91af4, ; 93: lib_Java.Interop.dll.so => 168
	i64 u0x13f1e880c25d96d1, ; 94: he/Microsoft.Maui.Controls.resources => 356
	i64 u0x1403071365bcd83a, ; 95: Xamarin.Firebase.Annotations => 300
	i64 u0x143d8ea60a6a4011, ; 96: Microsoft.Extensions.DependencyInjection.Abstractions => 185
	i64 u0x1497051b917530bd, ; 97: lib_System.Net.WebSockets.dll.so => 80
	i64 u0x14b78ce3adce0011, ; 98: Microsoft.VisualStudio.DesignTools.TapContract => 383
	i64 u0x14d612a531c79c05, ; 99: Xamarin.JSpecify.dll => 331
	i64 u0x14e68447938213b7, ; 100: Xamarin.AndroidX.Collection.Ktx.dll => 223
	i64 u0x152a448bd1e745a7, ; 101: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 102: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 103: lib_System.IO.FileSystem.dll.so => 50
	i64 u0x15e300c2c1668655, ; 104: System.Resources.Writer.dll => 100
	i64 u0x16bf2a22df043a09, ; 105: System.IO.Pipes.dll => 55
	i64 u0x16ea2b318ad2d830, ; 106: System.Security.Cryptography.Algorithms => 119
	i64 u0x16eeae54c7ebcc08, ; 107: System.Reflection.dll => 97
	i64 u0x17125c9a85b4929f, ; 108: lib_netstandard.dll.so => 167
	i64 u0x1716866f7416792e, ; 109: lib_System.Security.AccessControl.dll.so => 117
	i64 u0x174f71c46216e44a, ; 110: Xamarin.KotlinX.Coroutines.Core => 340
	i64 u0x1752c12f1e1fc00c, ; 111: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 112: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 359
	i64 u0x17f9358913beb16a, ; 113: System.Text.Encodings.Web => 136
	i64 u0x1809fb23f29ba44a, ; 114: lib_System.Reflection.TypeExtensions.dll.so => 96
	i64 u0x183850e11803945b, ; 115: Xamarin.Kotlin.Parcelize.Runtime => 333
	i64 u0x18402a709e357f3b, ; 116: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 344
	i64 u0x18a9befae51bb361, ; 117: System.Net.WebClient => 76
	i64 u0x18f0ce884e87d89a, ; 118: nb/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0x193d7a04b7eda8bc, ; 119: lib_Xamarin.AndroidX.Print.dll.so => 280
	i64 u0x19777fba3c41b398, ; 120: Xamarin.AndroidX.Startup.StartupRuntime.dll => 288
	i64 u0x19a4c090f14ebb66, ; 121: System.Security.Claims => 118
	i64 u0x1a91866a319e9259, ; 122: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 123: lib_System.dll.so => 164
	i64 u0x1aad60783ffa3e5b, ; 124: lib-th-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0x1aea8f1c3b282172, ; 125: lib_System.Net.Ping.dll.so => 69
	i64 u0x1b4b7a1d0d265fa2, ; 126: Xamarin.Android.Glide.DiskLruCache => 208
	i64 u0x1bbdb16cfa73e785, ; 127: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 266
	i64 u0x1bc766e07b2b4241, ; 128: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 283
	i64 u0x1c292b1598348d77, ; 129: Microsoft.Extensions.Diagnostics.dll => 186
	i64 u0x1c753b5ff15bce1b, ; 130: Mono.Android.Runtime.dll => 170
	i64 u0x1c7cbc0ecd18cdaf, ; 131: Xamarin.Firebase.Encoders.dll => 304
	i64 u0x1cb6a0ededc839e2, ; 132: lib_Google.Apis.Auth.dll.so => 178
	i64 u0x1cd47467799d8250, ; 133: System.Threading.Tasks.dll => 144
	i64 u0x1d23eafdc6dc346c, ; 134: System.Globalization.Calendars.dll => 39
	i64 u0x1da4110562816681, ; 135: Xamarin.AndroidX.Security.SecurityCrypto.dll => 286
	i64 u0x1db6820994506bf5, ; 136: System.IO.FileSystem.AccessControl.dll => 46
	i64 u0x1dbb0c2c6a999acb, ; 137: System.Diagnostics.StackTrace => 29
	i64 u0x1e3d87657e9659bc, ; 138: Xamarin.AndroidX.Navigation.UI => 277
	i64 u0x1e71143913d56c10, ; 139: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 363
	i64 u0x1e7c31185e2fb266, ; 140: lib_System.Threading.Tasks.Parallel.dll.so => 143
	i64 u0x1ed8fcce5e9b50a0, ; 141: Microsoft.Extensions.Options.dll => 192
	i64 u0x1ee2cd789d47ca68, ; 142: Xamarin.AndroidX.DataStore.Preferences.Proto => 246
	i64 u0x1f055d15d807e1b2, ; 143: System.Xml.XmlSerializer => 162
	i64 u0x1f1ed22c1085f044, ; 144: lib_System.Diagnostics.FileVersionInfo.dll.so => 27
	i64 u0x1f61df9c5b94d2c1, ; 145: lib_System.Numerics.dll.so => 83
	i64 u0x1f750bb5421397de, ; 146: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 290
	i64 u0x20237ea48006d7a8, ; 147: lib_System.Net.WebClient.dll.so => 76
	i64 u0x209375905fcc1bad, ; 148: lib_System.IO.Compression.Brotli.dll.so => 42
	i64 u0x20fab3cf2dfbc8df, ; 149: lib_System.Diagnostics.Process.dll.so => 28
	i64 u0x2110167c128cba15, ; 150: System.Globalization => 41
	i64 u0x21419508838f7547, ; 151: System.Runtime.CompilerServices.VisualC => 102
	i64 u0x2174319c0d835bc9, ; 152: System.Runtime => 116
	i64 u0x2198e5bc8b7153fa, ; 153: Xamarin.AndroidX.Annotation.Experimental.dll => 213
	i64 u0x219ea1b751a4dee4, ; 154: lib_System.IO.Compression.ZipFile.dll.so => 44
	i64 u0x21cc7e445dcd5469, ; 155: System.Reflection.Emit.ILGeneration => 90
	i64 u0x220fd4f2e7c48170, ; 156: th/Microsoft.Maui.Controls.resources => 374
	i64 u0x224538d85ed15a82, ; 157: System.IO.Pipes => 55
	i64 u0x22908438c6bed1af, ; 158: lib_System.Threading.Timer.dll.so => 147
	i64 u0x22fbc14e981e3b45, ; 159: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 382
	i64 u0x2347c268e3e4e536, ; 160: Xamarin.GooglePlayServices.Basement.dll => 324
	i64 u0x237be844f1f812c7, ; 161: System.Threading.Thread.dll => 145
	i64 u0x23852b3bdc9f7096, ; 162: System.Resources.ResourceManager => 99
	i64 u0x23986dd7e5d4fc01, ; 163: System.IO.FileSystem.Primitives.dll => 48
	i64 u0x2407aef2bbe8fadf, ; 164: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 165: Xamarin.AndroidX.Core.dll => 228
	i64 u0x247619fe4413f8bf, ; 166: System.Runtime.Serialization.Primitives.dll => 113
	i64 u0x24d4238047d7310f, ; 167: Google.Apis.Auth => 178
	i64 u0x24de8d301281575e, ; 168: Xamarin.Android.Glide => 206
	i64 u0x252073cc3caa62c2, ; 169: fr/Microsoft.Maui.Controls.resources.dll => 355
	i64 u0x256b8d41255f01b1, ; 170: Xamarin.Google.Crypto.Tink.Android => 317
	i64 u0x2662c629b96b0b30, ; 171: lib_Xamarin.Kotlin.StdLib.dll.so => 334
	i64 u0x268c1439f13bcc29, ; 172: lib_Microsoft.Extensions.Primitives.dll.so => 194
	i64 u0x26a670e154a9c54b, ; 173: System.Reflection.Extensions.dll => 93
	i64 u0x26d077d9678fe34f, ; 174: System.IO.dll => 57
	i64 u0x273f3515de5faf0d, ; 175: id/Microsoft.Maui.Controls.resources.dll => 360
	i64 u0x2742545f9094896d, ; 176: hr/Microsoft.Maui.Controls.resources => 358
	i64 u0x2759af78ab94d39b, ; 177: System.Net.WebSockets => 80
	i64 u0x27b2b16f3e9de038, ; 178: Xamarin.Google.Crypto.Tink.Android.dll => 317
	i64 u0x27b410442fad6cf1, ; 179: Java.Interop.dll => 168
	i64 u0x27b97e0d52c3034a, ; 180: System.Diagnostics.Debug => 26
	i64 u0x27c1227907352196, ; 181: lib_Xamarin.Firebase.Installations.InterOp.dll.so => 309
	i64 u0x27eb21c6eb99d774, ; 182: Xamarin.Kotlin.StdLib.Jdk8.dll => 336
	i64 u0x2801845a2c71fbfb, ; 183: System.Net.Primitives.dll => 70
	i64 u0x286835e259162700, ; 184: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 281
	i64 u0x28e52865585a1ebe, ; 185: Microsoft.Extensions.Diagnostics.Abstractions.dll => 187
	i64 u0x2949f3617a02c6b2, ; 186: Xamarin.AndroidX.ExifInterface => 252
	i64 u0x29f947844fb7fc11, ; 187: Microsoft.Maui.Controls.HotReload.Forms => 381
	i64 u0x2a128783efe70ba0, ; 188: uk/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0x2a3b095612184159, ; 189: lib_System.Net.NetworkInformation.dll.so => 68
	i64 u0x2a6507a5ffabdf28, ; 190: System.Diagnostics.TraceSource.dll => 32
	i64 u0x2ad156c8e1354139, ; 191: fi/Microsoft.Maui.Controls.resources => 354
	i64 u0x2ad5d6b13b7a3e04, ; 192: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 193: System.Text.RegularExpressions.dll => 138
	i64 u0x2afc1c4f898552ee, ; 194: lib_System.Formats.Asn1.dll.so => 37
	i64 u0x2b148910ed40fbf9, ; 195: zh-Hant/Microsoft.Maui.Controls.resources.dll => 380
	i64 u0x2b6989d78cba9a15, ; 196: Xamarin.AndroidX.Concurrent.Futures.dll => 224
	i64 u0x2c517f906db0a191, ; 197: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 313
	i64 u0x2c8bd14bb93a7d82, ; 198: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0x2cbd9262ca785540, ; 199: lib_System.Text.Encoding.CodePages.dll.so => 133
	i64 u0x2cc9e1fed6257257, ; 200: lib_System.Reflection.Emit.Lightweight.dll.so => 91
	i64 u0x2cd723e9fe623c7c, ; 201: lib_System.Private.Xml.Linq.dll.so => 87
	i64 u0x2d169d318a968379, ; 202: System.Threading.dll => 148
	i64 u0x2d4321e4dc4d6581, ; 203: Xamarin.AndroidX.DataStore.Preferences.Proto.dll => 246
	i64 u0x2d47774b7d993f59, ; 204: sv/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0x2d5ffcae1ad0aaca, ; 205: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 206: System.Text.Json.dll => 137
	i64 u0x2dcaa0bb15a4117a, ; 207: System.IO.UnmanagedMemoryStream.dll => 56
	i64 u0x2e5a40c319acb800, ; 208: System.IO.FileSystem => 50
	i64 u0x2e6f1f226821322a, ; 209: el/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0x2e7ae36a08a1dbb3, ; 210: Xamarin.Firebase.Encoders => 304
	i64 u0x2f02f94df3200fe5, ; 211: System.Diagnostics.Process => 28
	i64 u0x2f2e98e1c89b1aff, ; 212: System.Xml.ReaderWriter => 156
	i64 u0x2f5911d9ba814e4e, ; 213: System.Diagnostics.Tracing => 33
	i64 u0x2f84070a459bc31f, ; 214: lib_System.Xml.dll.so => 163
	i64 u0x2ff49de6a71764a1, ; 215: lib_Microsoft.Extensions.Http.dll.so => 188
	i64 u0x301713b5054e4388, ; 216: Xamarin.GooglePlayServices.Stats.dll => 327
	i64 u0x3053de11b4c0cb63, ; 217: lib_Xamarin.Firebase.Measurement.Connector.dll.so => 310
	i64 u0x30829702a4057a12, ; 218: Xamarin.Google.Android.DataTransport.TransportBackendCct => 313
	i64 u0x309ee9eeec09a71e, ; 219: lib_Xamarin.AndroidX.Fragment.dll.so => 253
	i64 u0x30c6dda129408828, ; 220: System.IO.IsolatedStorage => 51
	i64 u0x30ff0edf3d280bcd, ; 221: Firebase.Auth => 176
	i64 u0x3105ecad5c9e6bb6, ; 222: lib_Xamarin.Kotlin.Parcelize.Runtime.dll.so => 333
	i64 u0x31195fef5d8fb552, ; 223: _Microsoft.Android.Resource.Designer.dll => 385
	i64 u0x312c8ed623cbfc8d, ; 224: Xamarin.AndroidX.Window.dll => 298
	i64 u0x31496b779ed0663d, ; 225: lib_System.Reflection.DispatchProxy.dll.so => 89
	i64 u0x31f946282b3de50c, ; 226: Xamarin.Firebase.Datatransport.dll => 303
	i64 u0x3200b1eae7efaded, ; 227: lib_Xamarin.Firebase.Encoders.JSON.dll.so => 305
	i64 u0x32243413e774362a, ; 228: Xamarin.AndroidX.CardView.dll => 220
	i64 u0x3235427f8d12dae1, ; 229: lib_System.Drawing.Primitives.dll.so => 34
	i64 u0x329753a17a517811, ; 230: fr/Microsoft.Maui.Controls.resources => 355
	i64 u0x32aa989ff07a84ff, ; 231: lib_System.Xml.ReaderWriter.dll.so => 156
	i64 u0x32cdf435a3444de9, ; 232: Xamarin.AndroidX.DataStore.Preferences.Android => 242
	i64 u0x33829542f112d59b, ; 233: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 234: lib-es-Microsoft.Maui.Controls.resources.dll.so => 353
	i64 u0x341abc357fbb4ebf, ; 235: lib_System.Net.Sockets.dll.so => 75
	i64 u0x3496c1e2dcaf5ecc, ; 236: lib_System.IO.Pipes.AccessControl.dll.so => 54
	i64 u0x34dfd74fe2afcf37, ; 237: Microsoft.Maui => 197
	i64 u0x34e292762d9615df, ; 238: cs/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0x34f550615634aa64, ; 239: lib_Xamarin.Firebase.Encoders.dll.so => 304
	i64 u0x3508234247f48404, ; 240: Microsoft.Maui.Controls => 195
	i64 u0x353590da528c9d22, ; 241: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 242: lib_Xamarin.AndroidX.ViewPager2.dll.so => 297
	i64 u0x355282fc1c909694, ; 243: Microsoft.Extensions.Configuration => 181
	i64 u0x3552fc5d578f0fbf, ; 244: Xamarin.AndroidX.Arch.Core.Common => 217
	i64 u0x355c649948d55d97, ; 245: lib_System.Runtime.Intrinsics.dll.so => 108
	i64 u0x35ea9d1c6834bc8c, ; 246: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 269
	i64 u0x3628ab68db23a01a, ; 247: lib_System.Diagnostics.Tools.dll.so => 31
	i64 u0x364703ab05867b92, ; 248: Xamarin.Firebase.Components => 302
	i64 u0x3673b042508f5b6b, ; 249: lib_System.Runtime.Extensions.dll.so => 103
	i64 u0x36740f1a8ecdc6c4, ; 250: System.Numerics => 83
	i64 u0x36b2b50fdf589ae2, ; 251: System.Reflection.Emit.Lightweight => 91
	i64 u0x36cada77dc79928b, ; 252: System.IO.MemoryMappedFiles => 52
	i64 u0x37487f1e3ecbbade, ; 253: Xamarin.AndroidX.DataStore.Core => 236
	i64 u0x374ef46b06791af6, ; 254: System.Reflection.Primitives.dll => 95
	i64 u0x376bf93e521a5417, ; 255: lib_Xamarin.Jetbrains.Annotations.dll.so => 330
	i64 u0x37bc29f3183003b6, ; 256: lib_System.IO.dll.so => 57
	i64 u0x380134e03b1e160a, ; 257: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 258: System.Runtime.CompilerServices.Unsafe => 101
	i64 u0x385c17636bb6fe6e, ; 259: Xamarin.AndroidX.CustomView.dll => 232
	i64 u0x386a5eca994fd129, ; 260: Xamarin.AndroidX.DataStore.Preferences => 241
	i64 u0x38869c811d74050e, ; 261: System.Net.NameResolution.dll => 67
	i64 u0x393c226616977fdb, ; 262: lib_Xamarin.AndroidX.ViewPager.dll.so => 296
	i64 u0x395e37c3334cf82a, ; 263: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0x39aa39fda111d9d3, ; 264: Newtonsoft.Json => 200
	i64 u0x3ab5859054645f72, ; 265: System.Security.Cryptography.Primitives.dll => 124
	i64 u0x3ad75090c3fac0e9, ; 266: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 283
	i64 u0x3ae44ac43a1fbdbb, ; 267: System.Runtime.Serialization => 115
	i64 u0x3b860f9932505633, ; 268: lib_System.Text.Encoding.Extensions.dll.so => 134
	i64 u0x3be99b43dd39dd37, ; 269: Xamarin.AndroidX.SavedState.SavedState.Android => 285
	i64 u0x3c3aafb6b3a00bf6, ; 270: lib_System.Security.Cryptography.X509Certificates.dll.so => 125
	i64 u0x3c4049146b59aa90, ; 271: System.Runtime.InteropServices.JavaScript => 105
	i64 u0x3c7c495f58ac5ee9, ; 272: Xamarin.Kotlin.StdLib => 334
	i64 u0x3c7e5ed3d5db71bb, ; 273: System.Security => 130
	i64 u0x3cd9d281d402eb9b, ; 274: Xamarin.AndroidX.Browser.dll => 219
	i64 u0x3d1c50cc001a991e, ; 275: Xamarin.Google.Guava.ListenableFuture.dll => 319
	i64 u0x3d2b1913edfc08d7, ; 276: lib_System.Threading.ThreadPool.dll.so => 146
	i64 u0x3d46f0b995082740, ; 277: System.Xml.Linq => 155
	i64 u0x3d8a8f400514a790, ; 278: Xamarin.AndroidX.Fragment.Ktx.dll => 254
	i64 u0x3d9c2a242b040a50, ; 279: lib_Xamarin.AndroidX.Core.dll.so => 228
	i64 u0x3dbb6b9f5ab90fa7, ; 280: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 249
	i64 u0x3dfa52cefb81a78c, ; 281: Xamarin.AndroidX.DataStore.dll => 234
	i64 u0x3e250296f3b5714d, ; 282: Xamarin.Firebase.Measurement.Connector => 310
	i64 u0x3e5441657549b213, ; 283: Xamarin.AndroidX.ResourceInspection.Annotation => 283
	i64 u0x3e57d4d195c53c2e, ; 284: System.Reflection.TypeExtensions => 96
	i64 u0x3e616ab4ed1f3f15, ; 285: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 286: Xamarin.AndroidX.SlidingPaneLayout.dll => 287
	i64 u0x3f510adf788828dd, ; 287: System.Threading.Tasks.Extensions => 142
	i64 u0x407740ff2e914d86, ; 288: Xamarin.AndroidX.Print.dll => 280
	i64 u0x407a10bb4bf95829, ; 289: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 274
	i64 u0x40c98b6bd77346d4, ; 290: Microsoft.VisualBasic.dll => 3
	i64 u0x41833cf766d27d96, ; 291: mscorlib => 166
	i64 u0x41cab042be111c34, ; 292: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 216
	i64 u0x423a9ecc4d905a88, ; 293: lib_System.Resources.ResourceManager.dll.so => 99
	i64 u0x423bf51ae7def810, ; 294: System.Xml.XPath => 160
	i64 u0x42462ff15ddba223, ; 295: System.Resources.Reader.dll => 98
	i64 u0x4291015ff4e5ef71, ; 296: Xamarin.AndroidX.Core.ViewTree.dll => 230
	i64 u0x42a31b86e6ccc3f0, ; 297: System.Diagnostics.Contracts => 25
	i64 u0x42d3cd7add035099, ; 298: System.Management.dll => 205
	i64 u0x430e95b891249788, ; 299: lib_System.Reflection.Emit.dll.so => 92
	i64 u0x43375950ec7c1b6a, ; 300: netstandard.dll => 167
	i64 u0x434c4e1d9284cdae, ; 301: Mono.Android.dll => 171
	i64 u0x43505013578652a0, ; 302: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 211
	i64 u0x437d06c381ed575a, ; 303: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 304: pl/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0x43c077442b230f64, ; 305: Xamarin.AndroidX.Tracing.Tracing.Android => 291
	i64 u0x43e8ca5bc927ff37, ; 306: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 251
	i64 u0x448bd33429269b19, ; 307: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 308: lib_System.Runtime.Serialization.Primitives.dll.so => 113
	i64 u0x4515080865a951a5, ; 309: Xamarin.Kotlin.StdLib.dll => 334
	i64 u0x4545802489b736b9, ; 310: Xamarin.AndroidX.Fragment.Ktx => 254
	i64 u0x454b4d1e66bb783c, ; 311: Xamarin.AndroidX.Lifecycle.Process => 262
	i64 u0x45b31d67ff6f2b8a, ; 312: lib_Google.Apis.dll.so => 177
	i64 u0x45c40276a42e283e, ; 313: System.Diagnostics.TraceSource => 32
	i64 u0x45d443f2a29adc37, ; 314: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 315: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0x47358bd471172e1d, ; 316: lib_System.Xml.Linq.dll.so => 155
	i64 u0x47a2af602ae797ed, ; 317: lib_Xamarin.KotlinX.Coroutines.Play.Services.dll.so => 342
	i64 u0x47daf4e1afbada10, ; 318: pt/Microsoft.Maui.Controls.resources => 369
	i64 u0x480c0a47dd42dd81, ; 319: lib_System.IO.MemoryMappedFiles.dll.so => 52
	i64 u0x488d293220a4fe37, ; 320: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 256
	i64 u0x49946f0d78a813ad, ; 321: Xamarin.GooglePlayServices.Auth.Api.Phone => 321
	i64 u0x49e952f19a4e2022, ; 322: System.ObjectModel => 84
	i64 u0x49f6ab815e178ca9, ; 323: lib_Xamarin.Firebase.Common.dll.so => 301
	i64 u0x49f9e6948a8131e4, ; 324: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 295
	i64 u0x4a5667b2462a664b, ; 325: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 277
	i64 u0x4a7a18981dbd56bc, ; 326: System.IO.Compression.FileSystem.dll => 43
	i64 u0x4aa5c60350917c06, ; 327: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 261
	i64 u0x4b07a0ed0ab33ff4, ; 328: System.Runtime.Extensions.dll => 103
	i64 u0x4b576d47ac054f3c, ; 329: System.IO.FileSystem.AccessControl => 46
	i64 u0x4b7b6532ded934b7, ; 330: System.Text.Json => 137
	i64 u0x4bb6f6e34164a378, ; 331: Square.OkIO.JVM.dll => 202
	i64 u0x4bbdff0fed34406f, ; 332: lib_Xamarin.AndroidX.DataStore.Core.dll.so => 236
	i64 u0x4c2029a97af23a8d, ; 333: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 271
	i64 u0x4c7755cf07ad2d5f, ; 334: System.Net.Http.Json.dll => 63
	i64 u0x4cad38a03a928144, ; 335: lib_Xamarin.Firebase.Encoders.Proto.dll.so => 306
	i64 u0x4cc5f15266470798, ; 336: lib_Xamarin.AndroidX.Loader.dll.so => 272
	i64 u0x4cf6f67dc77aacd2, ; 337: System.Net.NetworkInformation.dll => 68
	i64 u0x4d3183dd245425d4, ; 338: System.Net.WebSockets.Client.dll => 79
	i64 u0x4d479f968a05e504, ; 339: System.Linq.Expressions.dll => 58
	i64 u0x4d55a010ffc4faff, ; 340: System.Private.Xml => 88
	i64 u0x4d5cbe77561c5b2e, ; 341: System.Web.dll => 153
	i64 u0x4d77512dbd86ee4c, ; 342: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 217
	i64 u0x4d7793536e79c309, ; 343: System.ServiceProcess => 132
	i64 u0x4d95fccc1f67c7ca, ; 344: System.Runtime.Loader.dll => 109
	i64 u0x4dcf44c3c9b076a2, ; 345: it/Microsoft.Maui.Controls.resources.dll => 361
	i64 u0x4dd9247f1d2c3235, ; 346: Xamarin.AndroidX.Loader.dll => 272
	i64 u0x4e2aeee78e2c4a87, ; 347: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 281
	i64 u0x4e32f00cb0937401, ; 348: Mono.Android.Runtime => 170
	i64 u0x4e5eea4668ac2b18, ; 349: System.Text.Encoding.CodePages => 133
	i64 u0x4e742b34f53425d7, ; 350: Xamarin.Firebase.Encoders.Proto.dll => 306
	i64 u0x4ebd0c4b82c5eefc, ; 351: lib_System.Threading.Channels.dll.so => 139
	i64 u0x4ee8eaa9c9c1151a, ; 352: System.Globalization.Calendars => 39
	i64 u0x4f21ee6ef9eb527e, ; 353: ca/Microsoft.Maui.Controls.resources => 348
	i64 u0x4fdc964ec1888e25, ; 354: lib_Microsoft.Extensions.Configuration.Binder.dll.so => 183
	i64 u0x5037f0be3c28c7a3, ; 355: lib_Microsoft.Maui.Controls.dll.so => 195
	i64 u0x50bd8cfae0f07500, ; 356: lib_Xamarin.GooglePlayServices.Stats.dll.so => 327
	i64 u0x50c3a29b21050d45, ; 357: System.Linq.Parallel.dll => 59
	i64 u0x5112ed116d87baf8, ; 358: CommunityToolkit.Mvvm => 175
	i64 u0x5116b21580ae6eb0, ; 359: Microsoft.Extensions.Configuration.Binder.dll => 183
	i64 u0x5131bbe80989093f, ; 360: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 268
	i64 u0x516324a5050a7e3c, ; 361: System.Net.WebProxy => 78
	i64 u0x516d6f0b21a303de, ; 362: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 363: System.Drawing => 35
	i64 u0x5247c5c32a4140f0, ; 364: System.Resources.Reader => 98
	i64 u0x526bb15e3c386364, ; 365: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 265
	i64 u0x526ce79eb8e90527, ; 366: lib_System.Net.Primitives.dll.so => 70
	i64 u0x52829f00b4467c38, ; 367: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 368: Xamarin.AndroidX.Core => 228
	i64 u0x52ff996554dbf352, ; 369: Microsoft.Maui.Graphics => 199
	i64 u0x535f7e40e8fef8af, ; 370: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0x53978aac584c666e, ; 371: lib_System.Security.Cryptography.Cng.dll.so => 120
	i64 u0x53a96d5c86c9e194, ; 372: System.Net.NetworkInformation => 68
	i64 u0x53be1038a61e8d44, ; 373: System.Runtime.InteropServices.RuntimeInformation.dll => 106
	i64 u0x53c3014b9437e684, ; 374: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 378
	i64 u0x53e450ebd586f842, ; 375: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 273
	i64 u0x5435e6f049e9bc37, ; 376: System.Security.Claims.dll => 118
	i64 u0x54795225dd1587af, ; 377: lib_System.Runtime.dll.so => 116
	i64 u0x547a34f14e5f6210, ; 378: Xamarin.AndroidX.Lifecycle.Common.dll => 257
	i64 u0x54b42cc2b8e65a84, ; 379: Google.Apis.Core.dll => 179
	i64 u0x556cbe75fae265ee, ; 380: lib_Xamarin.AndroidX.DataStore.Android.dll.so => 235
	i64 u0x556e8b63b660ab8b, ; 381: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 258
	i64 u0x5588627c9a108ec9, ; 382: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 383: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 384: lib_System.Security.Cryptography.OpenSsl.dll.so => 123
	i64 u0x5622206b5c5ddd58, ; 385: Xamarin.Kotlin.Parcelize.Runtime.dll => 333
	i64 u0x56442b99bc64bb47, ; 386: System.Runtime.Serialization.Xml.dll => 114
	i64 u0x56a5d2c17db41bcb, ; 387: Xamarin.Google.Android.DataTransport.TransportRuntime => 314
	i64 u0x56a8b26e1aeae27b, ; 388: System.Threading.Tasks.Dataflow => 141
	i64 u0x56f932d61e93c07f, ; 389: System.Globalization.Extensions => 40
	i64 u0x571c5cfbec5ae8e2, ; 390: System.Private.Uri => 86
	i64 u0x576499c9f52fea31, ; 391: Xamarin.AndroidX.Annotation => 212
	i64 u0x579a06fed6eec900, ; 392: System.Private.CoreLib.dll => 172
	i64 u0x57c542c14049b66d, ; 393: System.Diagnostics.DiagnosticSource => 204
	i64 u0x57d95873b79e158b, ; 394: lib_Xamarin.AndroidX.DataStore.Preferences.dll.so => 241
	i64 u0x581a8bd5cfda563e, ; 395: System.Threading.Timer => 147
	i64 u0x584ac38e21d2fde1, ; 396: Microsoft.Extensions.Configuration.Binder => 183
	i64 u0x58601b2dda4a27b9, ; 397: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 362
	i64 u0x58688d9af496b168, ; 398: Microsoft.Extensions.DependencyInjection.dll => 184
	i64 u0x588c167a79db6bfb, ; 399: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 318
	i64 u0x5906028ae5151104, ; 400: Xamarin.AndroidX.Activity.Ktx => 211
	i64 u0x595a356d23e8da9a, ; 401: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59f9e60b9475085f, ; 402: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 213
	i64 u0x5a745f5101a75527, ; 403: lib_System.IO.Compression.FileSystem.dll.so => 43
	i64 u0x5a89a886ae30258d, ; 404: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 227
	i64 u0x5a8f6699f4a1caa9, ; 405: lib_System.Threading.dll.so => 148
	i64 u0x5ae8e4f3eae4d547, ; 406: Xamarin.AndroidX.Legacy.Support.Core.Utils => 256
	i64 u0x5ae9cd33b15841bf, ; 407: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 408: System.Private.DataContractSerialization => 85
	i64 u0x5b5f0e240a06a2a2, ; 409: da/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0x5b755276902c8414, ; 410: Xamarin.GooglePlayServices.Base => 323
	i64 u0x5b8109e8e14c5e3e, ; 411: System.Globalization.Extensions.dll => 40
	i64 u0x5bddd04d72a9e350, ; 412: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 261
	i64 u0x5bdf16b09da116ab, ; 413: Xamarin.AndroidX.Collection => 221
	i64 u0x5bff6a70194300bd, ; 414: lib_Xamarin.Kotlin.StdLib.Jdk8.dll.so => 336
	i64 u0x5c019d5266093159, ; 415: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 266
	i64 u0x5c30a4a35f9cc8c4, ; 416: lib_System.Reflection.Extensions.dll.so => 93
	i64 u0x5c393624b8176517, ; 417: lib_Microsoft.Extensions.Logging.dll.so => 189
	i64 u0x5c53c29f5073b0c9, ; 418: System.Diagnostics.FileVersionInfo => 27
	i64 u0x5c87463c575c7616, ; 419: lib_System.Globalization.Extensions.dll.so => 40
	i64 u0x5d0a4a29b02d9d3c, ; 420: System.Net.WebHeaderCollection.dll => 77
	i64 u0x5d40c9b15181641f, ; 421: lib_Xamarin.AndroidX.Emoji2.dll.so => 250
	i64 u0x5d6ca10d35e9485b, ; 422: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 224
	i64 u0x5d7ec76c1c703055, ; 423: System.Threading.Tasks.Parallel => 143
	i64 u0x5db0cbbd1028510e, ; 424: lib_System.Runtime.InteropServices.dll.so => 107
	i64 u0x5db30905d3e5013b, ; 425: Xamarin.AndroidX.Collection.Jvm.dll => 222
	i64 u0x5dd10b96620cce23, ; 426: Xamarin.Firebase.Iid.Interop => 307
	i64 u0x5e467bc8f09ad026, ; 427: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 428: System.Runtime.Handles.dll => 104
	i64 u0x5e73087bb1e71a79, ; 429: lib_Xamarin.AndroidX.DataStore.Preferences.Proto.dll.so => 246
	i64 u0x5ea92fdb19ec8c4c, ; 430: System.Text.Encodings.Web.dll => 136
	i64 u0x5eb8046dd40e9ac3, ; 431: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 432: System.Security.Cryptography.Csp.dll => 121
	i64 u0x5eee1376d94c7f5e, ; 433: System.Net.HttpListener.dll => 65
	i64 u0x5f36ccf5c6a57e24, ; 434: System.Xml.ReaderWriter.dll => 156
	i64 u0x5f4294b9b63cb842, ; 435: System.Data.Common => 22
	i64 u0x5f4fa8b9ffd0e2c5, ; 436: lib_Xamarin.Google.Android.DataTransport.TransportApi.dll.so => 312
	i64 u0x5f9a2d823f664957, ; 437: lib-el-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0x5fa6da9c3cd8142a, ; 438: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 343
	i64 u0x5fac98e0b37a5b9d, ; 439: System.Runtime.CompilerServices.Unsafe.dll => 101
	i64 u0x609f4b7b63d802d4, ; 440: lib_Microsoft.Extensions.DependencyInjection.dll.so => 184
	i64 u0x60cd4e33d7e60134, ; 441: Xamarin.KotlinX.Coroutines.Core.Jvm => 341
	i64 u0x60ee72f71c4b3113, ; 442: Xamarin.Firebase.Iid.Interop.dll => 307
	i64 u0x60f62d786afcf130, ; 443: System.Memory => 62
	i64 u0x61bb78c89f867353, ; 444: System.IO => 57
	i64 u0x61be8d1299194243, ; 445: Microsoft.Maui.Controls.Xaml => 196
	i64 u0x61d2cba29557038f, ; 446: de/Microsoft.Maui.Controls.resources => 351
	i64 u0x61d88f399afb2f45, ; 447: lib_System.Runtime.Loader.dll.so => 109
	i64 u0x622eef6f9e59068d, ; 448: System.Private.CoreLib => 172
	i64 u0x63cdbd66ac39bb46, ; 449: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 384
	i64 u0x63d5e3aa4ef9b931, ; 450: Xamarin.KotlinX.Coroutines.Android.dll => 339
	i64 u0x63f1f6883c1e23c2, ; 451: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 452: Xamarin.Google.Android.Material.dll => 315
	i64 u0x640e3b14dbd325c2, ; 453: System.Security.Cryptography.Algorithms.dll => 119
	i64 u0x64587004560099b9, ; 454: System.Reflection => 97
	i64 u0x646bbda4b2219cc2, ; 455: lib_Xamarin.Firebase.Datatransport.dll.so => 303
	i64 u0x64b1529a438a3c45, ; 456: lib_System.Runtime.Handles.dll.so => 104
	i64 u0x64f30e567cb41fac, ; 457: Xamarin.KotlinX.Coroutines.Play.Services => 342
	i64 u0x6565fba2cd8f235b, ; 458: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 269
	i64 u0x658f524e4aba7dad, ; 459: CommunityToolkit.Maui.dll => 173
	i64 u0x65ecac39144dd3cc, ; 460: Microsoft.Maui.Controls.dll => 195
	i64 u0x65ece51227bfa724, ; 461: lib_System.Runtime.Numerics.dll.so => 110
	i64 u0x661722438787b57f, ; 462: Xamarin.AndroidX.Annotation.Jvm.dll => 214
	i64 u0x6679b2337ee6b22a, ; 463: lib_System.IO.FileSystem.Primitives.dll.so => 48
	i64 u0x6692e924eade1b29, ; 464: lib_System.Console.dll.so => 20
	i64 u0x669b2e9020ef2b4e, ; 465: Xamarin.Firebase.Datatransport => 303
	i64 u0x66a4e5c6a3fb0bae, ; 466: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 268
	i64 u0x66d13304ce1a3efa, ; 467: Xamarin.AndroidX.CursorAdapter => 231
	i64 u0x66e86f2ff0ba0e5e, ; 468: Xamarin.KotlinX.Serialization.Protobuf => 345
	i64 u0x674303f65d8fad6f, ; 469: lib_System.Net.Quic.dll.so => 71
	i64 u0x6756ca4cad62e9d6, ; 470: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 226
	i64 u0x67bca11acb828d8d, ; 471: lib_Xamarin.Google.Android.DataTransport.TransportBackendCct.dll.so => 313
	i64 u0x67c0802770244408, ; 472: System.Windows.dll => 154
	i64 u0x68100b69286e27cd, ; 473: lib_System.Formats.Tar.dll.so => 38
	i64 u0x68558ec653afa616, ; 474: lib-da-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0x6872ec7a2e36b1ac, ; 475: System.Drawing.Primitives.dll => 34
	i64 u0x68bb2c417aa9b61c, ; 476: Xamarin.KotlinX.AtomicFU.dll => 337
	i64 u0x68fbbbe2eb455198, ; 477: System.Formats.Asn1 => 37
	i64 u0x69063fc0ba8e6bdd, ; 478: he/Microsoft.Maui.Controls.resources.dll => 356
	i64 u0x69a3e26c76f6eec4, ; 479: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 299
	i64 u0x6a4d7577b2317255, ; 480: System.Runtime.InteropServices.dll => 107
	i64 u0x6a61e5b7d5907416, ; 481: lib_Xamarin.GooglePlayServices.Auth.Api.Phone.dll.so => 321
	i64 u0x6ace3b74b15ee4a4, ; 482: nb/Microsoft.Maui.Controls.resources => 365
	i64 u0x6afcedb171067e2b, ; 483: System.Core.dll => 21
	i64 u0x6bc822f45373a1d6, ; 484: Google.Apis.dll => 177
	i64 u0x6bef98e124147c24, ; 485: Xamarin.Jetbrains.Annotations => 330
	i64 u0x6ccc0c6e8d8aabeb, ; 486: VendCaseStudy.dll => 0
	i64 u0x6ce874bff138ce2b, ; 487: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 267
	i64 u0x6cfa2bd175637715, ; 488: Square.OkIO.JVM => 202
	i64 u0x6d12bfaa99c72b1f, ; 489: lib_Microsoft.Maui.Graphics.dll.so => 199
	i64 u0x6d70755158ca866e, ; 490: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 491: Microsoft.Extensions.Primitives => 194
	i64 u0x6d7eeca99577fc8b, ; 492: lib_System.Net.WebProxy.dll.so => 78
	i64 u0x6d8515b19946b6a2, ; 493: System.Net.WebProxy.dll => 78
	i64 u0x6d86d56b84c8eb71, ; 494: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 231
	i64 u0x6d9bea6b3e895cf7, ; 495: Microsoft.Extensions.Primitives.dll => 194
	i64 u0x6dd9bf4083de3f6a, ; 496: Xamarin.AndroidX.DocumentFile.dll => 247
	i64 u0x6e25a02c3833319a, ; 497: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 275
	i64 u0x6e838d9a2a6f6c9e, ; 498: lib_System.ValueTuple.dll.so => 151
	i64 u0x6e9965ce1095e60a, ; 499: lib_System.Core.dll.so => 21
	i64 u0x6eb639ed1779c85f, ; 500: Xamarin.AndroidX.DataStore.Preferences.Android.dll => 242
	i64 u0x6f304d1dec1019e9, ; 501: lib_Xamarin.Firebase.Installations.dll.so => 308
	i64 u0x6fd2265da78b93a4, ; 502: lib_Microsoft.Maui.dll.so => 197
	i64 u0x6fdfc7de82c33008, ; 503: cs/Microsoft.Maui.Controls.resources => 349
	i64 u0x6ffc4967cc47ba57, ; 504: System.IO.FileSystem.Watcher.dll => 49
	i64 u0x701cd46a1c25a5fe, ; 505: System.IO.FileSystem.dll => 50
	i64 u0x70e99f48c05cb921, ; 506: tr/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0x70fd3deda22442d2, ; 507: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0x71485e7ffdb4b958, ; 508: System.Reflection.Extensions => 93
	i64 u0x7162a2fce67a945f, ; 509: lib_Xamarin.Android.Glide.Annotations.dll.so => 207
	i64 u0x717530326f808838, ; 510: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 187
	i64 u0x71a495ea3761dde8, ; 511: lib-it-Microsoft.Maui.Controls.resources.dll.so => 361
	i64 u0x71ad672adbe48f35, ; 512: System.ComponentModel.Primitives.dll => 16
	i64 u0x720f102581a4a5c8, ; 513: Xamarin.AndroidX.Core.ViewTree => 230
	i64 u0x722074ef3403bcd2, ; 514: lib_Xamarin.Kotlin.Android.Extensions.Runtime.Library.dll.so => 332
	i64 u0x725f5a9e82a45c81, ; 515: System.Security.Cryptography.Encoding => 122
	i64 u0x72b1fb4109e08d7b, ; 516: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 358
	i64 u0x72db2ce1769eb547, ; 517: Xamarin.AndroidX.DataStore => 234
	i64 u0x72e0300099accce1, ; 518: System.Xml.XPath.XDocument => 159
	i64 u0x730bfb248998f67a, ; 519: System.IO.Compression.ZipFile => 44
	i64 u0x732b2d67b9e5c47b, ; 520: Xamarin.Google.ErrorProne.Annotations.dll => 318
	i64 u0x734b76fdc0dc05bb, ; 521: lib_GoogleGson.dll.so => 180
	i64 u0x73a6be34e822f9d1, ; 522: lib_System.Runtime.Serialization.dll.so => 115
	i64 u0x73e4ce94e2eb6ffc, ; 523: lib_System.Memory.dll.so => 62
	i64 u0x74327ad47b9741a4, ; 524: Xamarin.AndroidX.NavigationEvent.Android.dll => 279
	i64 u0x743a1eccf080489a, ; 525: WindowsBase.dll => 165
	i64 u0x746cf89b511b4d40, ; 526: lib_Microsoft.Extensions.Diagnostics.dll.so => 186
	i64 u0x751ef193ea61c915, ; 527: lib_VendCaseStudy.dll.so => 0
	i64 u0x755a91767330b3d4, ; 528: lib_Microsoft.Extensions.Configuration.dll.so => 181
	i64 u0x75c326eb821b85c4, ; 529: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 530: lib_Xamarin.AndroidX.SavedState.dll.so => 284
	i64 u0x7695e24336464e91, ; 531: Xamarin.GooglePlayServices.Auth => 320
	i64 u0x76ca07b878f44da0, ; 532: System.Runtime.Numerics.dll => 110
	i64 u0x7736c8a96e51a061, ; 533: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 214
	i64 u0x778a805e625329ef, ; 534: System.Linq.Parallel => 59
	i64 u0x779290cc2b801eb7, ; 535: Xamarin.KotlinX.AtomicFU.Jvm => 338
	i64 u0x77f8a4acc2fdc449, ; 536: System.Security.Cryptography.Cng.dll => 120
	i64 u0x780bc73597a503a9, ; 537: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 364
	i64 u0x782bc71215c96dbe, ; 538: Xamarin.Kotlin.Android.Extensions.Runtime.Library => 332
	i64 u0x782c5d8eb99ff201, ; 539: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 540: th/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0x784b4ff3eed363ff, ; 541: Xamarin.Firebase.Common => 301
	i64 u0x78a0275e998ae4ef, ; 542: Xamarin.Firebase.Measurement.Connector.dll => 310
	i64 u0x78a45e51311409b6, ; 543: Xamarin.AndroidX.Fragment.dll => 253
	i64 u0x78d5c74e565733ea, ; 544: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 314
	i64 u0x78ed4ab8f9d800a1, ; 545: Xamarin.AndroidX.Lifecycle.ViewModel => 267
	i64 u0x793546dbadd324b1, ; 546: Xamarin.Google.Android.DataTransport.TransportApi => 312
	i64 u0x7a25bdb29108c6e7, ; 547: Microsoft.Extensions.Http => 188
	i64 u0x7a39601d6f0bb831, ; 548: lib_Xamarin.KotlinX.AtomicFU.dll.so => 337
	i64 u0x7a5207a7c82d30b4, ; 549: lib_Xamarin.JSpecify.dll.so => 331
	i64 u0x7a7e7eddf79c5d26, ; 550: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 267
	i64 u0x7a9a57d43b0845fa, ; 551: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 552: Xamarin.AndroidX.Collection.dll => 221
	i64 u0x7adb8da2ac89b647, ; 553: fi/Microsoft.Maui.Controls.resources.dll => 354
	i64 u0x7b13d9eaa944ade8, ; 554: Xamarin.AndroidX.DynamicAnimation.dll => 249
	i64 u0x7bef86a4335c4870, ; 555: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 556: sk/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0x7c2a0bd1e0f988fc, ; 557: lib-de-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0x7c41d387501568ba, ; 558: System.Net.WebClient.dll => 76
	i64 u0x7c482cd79bd24b13, ; 559: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 225
	i64 u0x7cb95ad2a929d044, ; 560: Xamarin.GooglePlayServices.Basement => 324
	i64 u0x7cc637f941f716d0, ; 561: CommunityToolkit.Maui.Core => 174
	i64 u0x7cd2ec8eaf5241cd, ; 562: System.Security.dll => 130
	i64 u0x7cf9ae50dd350622, ; 563: Xamarin.Jetbrains.Annotations.dll => 330
	i64 u0x7d649b75d580bb42, ; 564: ms/Microsoft.Maui.Controls.resources.dll => 364
	i64 u0x7d813289a305ba11, ; 565: Xamarin.AndroidX.DataStore.Preferences.Core.Jvm.dll => 244
	i64 u0x7d8ee2bdc8e3aad1, ; 566: System.Numerics.Vectors => 82
	i64 u0x7df5df8db8eaa6ac, ; 567: Microsoft.Extensions.Logging.Debug => 191
	i64 u0x7dfc3d6d9d8d7b70, ; 568: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 569: lib_System.Diagnostics.Tracing.dll.so => 33
	i64 u0x7e302e110e1e1346, ; 570: lib_System.Security.Claims.dll.so => 118
	i64 u0x7e4465b3f78ad8d0, ; 571: Xamarin.KotlinX.Serialization.Core.dll => 343
	i64 u0x7e571cad5915e6c3, ; 572: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 262
	i64 u0x7e6b1ca712437d7d, ; 573: Xamarin.AndroidX.Emoji2.ViewsHelper => 251
	i64 u0x7e946809d6008ef2, ; 574: lib_System.ObjectModel.dll.so => 84
	i64 u0x7ea0272c1b4a9635, ; 575: lib_Xamarin.Android.Glide.dll.so => 206
	i64 u0x7eb4f0dc47488736, ; 576: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 328
	i64 u0x7ecc13347c8fd849, ; 577: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 578: Xamarin.AndroidX.ViewPager.dll => 296
	i64 u0x7f9351cd44b1273f, ; 579: Microsoft.Extensions.Configuration.Abstractions => 182
	i64 u0x7fbd557c99b3ce6f, ; 580: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 260
	i64 u0x8076a9a44a2ca331, ; 581: System.Net.Quic => 71
	i64 u0x80b7e726b0280681, ; 582: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 382
	i64 u0x80da183a87731838, ; 583: System.Reflection.Metadata => 94
	i64 u0x812c069d5cdecc17, ; 584: System.dll => 164
	i64 u0x81381be520a60adb, ; 585: Xamarin.AndroidX.Interpolator.dll => 255
	i64 u0x81657cec2b31e8aa, ; 586: System.Net => 81
	i64 u0x81ab745f6c0f5ce6, ; 587: zh-Hant/Microsoft.Maui.Controls.resources => 380
	i64 u0x8277f2be6b5ce05f, ; 588: Xamarin.AndroidX.AppCompat => 215
	i64 u0x828f06563b30bc50, ; 589: lib_Xamarin.AndroidX.CardView.dll.so => 220
	i64 u0x82920a8d9194a019, ; 590: Xamarin.KotlinX.AtomicFU.Jvm.dll => 338
	i64 u0x82b399cb01b531c4, ; 591: lib_System.Web.dll.so => 153
	i64 u0x82df8f5532a10c59, ; 592: lib_System.Drawing.dll.so => 35
	i64 u0x82f0b6e911d13535, ; 593: lib_System.Transactions.dll.so => 150
	i64 u0x82f6403342e12049, ; 594: uk/Microsoft.Maui.Controls.resources => 376
	i64 u0x835690121a483668, ; 595: VendCaseStudy => 0
	i64 u0x83c14ba66c8e2b8c, ; 596: zh-Hans/Microsoft.Maui.Controls.resources => 379
	i64 u0x846ce984efea52c7, ; 597: System.Threading.Tasks.Parallel.dll => 143
	i64 u0x84ae73148a4557d2, ; 598: lib_System.IO.Pipes.dll.so => 55
	i64 u0x84b01102c12a9232, ; 599: System.Runtime.Serialization.Json.dll => 112
	i64 u0x850c5ba0b57ce8e7, ; 600: lib_Xamarin.AndroidX.Collection.dll.so => 221
	i64 u0x851d02edd334b044, ; 601: Xamarin.AndroidX.VectorDrawable => 293
	i64 u0x85c919db62150978, ; 602: Xamarin.AndroidX.Transition.dll => 292
	i64 u0x8662aaeb94fef37f, ; 603: lib_System.Dynamic.Runtime.dll.so => 36
	i64 u0x8680b2ae76d665ab, ; 604: Xamarin.AndroidX.DataStore.Core.OkIO.dll => 239
	i64 u0x86a909228dc7657b, ; 605: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 380
	i64 u0x86b3e00c36b84509, ; 606: Microsoft.Extensions.Configuration.dll => 181
	i64 u0x86b62cb077ec4fd7, ; 607: System.Runtime.Serialization.Xml => 114
	i64 u0x8706ffb12bf3f53d, ; 608: Xamarin.AndroidX.Annotation.Experimental => 213
	i64 u0x8716a374f95dc26e, ; 609: Xamarin.GooglePlayServices.Fido => 326
	i64 u0x872a5b14c18d328c, ; 610: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 611: Xamarin.Android.Glide.Annotations.dll => 207
	i64 u0x87c69b87d9283884, ; 612: lib_System.Threading.Thread.dll.so => 145
	i64 u0x87f6569b25707834, ; 613: System.IO.Compression.Brotli.dll => 42
	i64 u0x8842b3a5d2d3fb36, ; 614: Microsoft.Maui.Essentials => 198
	i64 u0x88926583efe7ee86, ; 615: Xamarin.AndroidX.Activity.Ktx.dll => 211
	i64 u0x88b16a1a7051ebe2, ; 616: Xamarin.Firebase.Annotations.dll => 300
	i64 u0x88ba6bc4f7762b03, ; 617: lib_System.Reflection.dll.so => 97
	i64 u0x88bda98e0cffb7a9, ; 618: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 341
	i64 u0x8930322c7bd8f768, ; 619: netstandard => 167
	i64 u0x897a606c9e39c75f, ; 620: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x898a5c6bc9e47ec1, ; 621: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 285
	i64 u0x89911a22005b92b7, ; 622: System.IO.FileSystem.DriveInfo.dll => 47
	i64 u0x89c5188089ec2cd5, ; 623: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 106
	i64 u0x8a19e3dc71b34b2c, ; 624: System.Reflection.TypeExtensions.dll => 96
	i64 u0x8ad229ea26432ee2, ; 625: Xamarin.AndroidX.Loader => 272
	i64 u0x8b4ff5d0fdd5faa1, ; 626: lib_System.Diagnostics.DiagnosticSource.dll.so => 204
	i64 u0x8b541d476eb3774c, ; 627: System.Security.Principal.Windows => 127
	i64 u0x8b7221bafb7e38bd, ; 628: Xamarin.AndroidX.DataStore.Core.OkIO.Jvm.dll => 240
	i64 u0x8b8d01333a96d0b5, ; 629: System.Diagnostics.Process.dll => 28
	i64 u0x8b9278242f21e276, ; 630: Xamarin.Firebase.Encoders.JSON.dll => 305
	i64 u0x8b9ceca7acae3451, ; 631: lib-he-Microsoft.Maui.Controls.resources.dll.so => 356
	i64 u0x8cdfdb4ce85fb925, ; 632: lib_System.Security.Principal.Windows.dll.so => 127
	i64 u0x8cdfe7b8f4caa426, ; 633: System.IO.Compression.FileSystem => 43
	i64 u0x8d0f420977c2c1c7, ; 634: Xamarin.AndroidX.CursorAdapter.dll => 231
	i64 u0x8d52f7ea2796c531, ; 635: Xamarin.AndroidX.Emoji2.dll => 250
	i64 u0x8d7b8ab4b3310ead, ; 636: System.Threading => 148
	i64 u0x8da188285aadfe8e, ; 637: System.Collections.Concurrent => 8
	i64 u0x8e8f269ad1e1ff94, ; 638: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 291
	i64 u0x8ec6e06a61c1baeb, ; 639: lib_Newtonsoft.Json.dll.so => 200
	i64 u0x8ed807bfe9858dfc, ; 640: Xamarin.AndroidX.Navigation.Common => 274
	i64 u0x8ee08b8194a30f48, ; 641: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 357
	i64 u0x8ef7601039857a44, ; 642: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0x8efbc0801a122264, ; 643: Xamarin.GooglePlayServices.Tasks.dll => 328
	i64 u0x8f32c6f611f6ffab, ; 644: pt/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0x8f44b45eb046bbd1, ; 645: System.ServiceModel.Web.dll => 131
	i64 u0x8f8829d21c8985a4, ; 646: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0x8fbf5b0114c6dcef, ; 647: System.Globalization.dll => 41
	i64 u0x8fcc8c2a81f3d9e7, ; 648: Xamarin.KotlinX.Serialization.Core => 343
	i64 u0x90263f8448b8f572, ; 649: lib_System.Diagnostics.TraceSource.dll.so => 32
	i64 u0x903101b46fb73a04, ; 650: _Microsoft.Android.Resource.Designer => 385
	i64 u0x90393bd4865292f3, ; 651: lib_System.IO.Compression.dll.so => 45
	i64 u0x905e2b8e7ae91ae6, ; 652: System.Threading.Tasks.Extensions.dll => 142
	i64 u0x90634f86c5ebe2b5, ; 653: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 268
	i64 u0x907b636704ad79ef, ; 654: lib_Microsoft.Maui.Controls.Xaml.dll.so => 196
	i64 u0x90e9efbfd68593e0, ; 655: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 259
	i64 u0x91418dc638b29e68, ; 656: lib_Xamarin.AndroidX.CustomView.dll.so => 232
	i64 u0x9157bd523cd7ed36, ; 657: lib_System.Text.Json.dll.so => 137
	i64 u0x91a74f07b30d37e2, ; 658: System.Linq.dll => 61
	i64 u0x91cb86ea3b17111d, ; 659: System.ServiceModel.Web => 131
	i64 u0x91fa41a87223399f, ; 660: ca/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0x92054e486c0c7ea7, ; 661: System.IO.FileSystem.DriveInfo => 47
	i64 u0x928614058c40c4cd, ; 662: lib_System.Xml.XPath.XDocument.dll.so => 159
	i64 u0x92a698e6d582778f, ; 663: Xamarin.Firebase.Components.dll => 302
	i64 u0x92b138fffca2b01e, ; 664: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 218
	i64 u0x92dfc2bfc6c6a888, ; 665: Xamarin.AndroidX.Lifecycle.LiveData => 259
	i64 u0x933da2c779423d68, ; 666: Xamarin.Android.Glide.Annotations => 207
	i64 u0x9388aad9b7ae40ce, ; 667: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 257
	i64 u0x93a39f9bbc3b3ca4, ; 668: Xamarin.GooglePlayServices.CloudMessaging.dll => 325
	i64 u0x93cfa73ab28d6e35, ; 669: ms/Microsoft.Maui.Controls.resources => 364
	i64 u0x941c00d21e5c0679, ; 670: lib_Xamarin.AndroidX.Transition.dll.so => 292
	i64 u0x942c506108d284a8, ; 671: lib_Xamarin.AndroidX.DataStore.Preferences.Core.Jvm.dll.so => 244
	i64 u0x944077d8ca3c6580, ; 672: System.IO.Compression.dll => 45
	i64 u0x948cffedc8ed7960, ; 673: System.Xml => 163
	i64 u0x94c8990839c4bdb1, ; 674: lib_Xamarin.AndroidX.Interpolator.dll.so => 255
	i64 u0x967fc325e09bfa8c, ; 675: es/Microsoft.Maui.Controls.resources => 353
	i64 u0x9686161486d34b81, ; 676: lib_Xamarin.AndroidX.ExifInterface.dll.so => 252
	i64 u0x9729c8c4c069c478, ; 677: Google.Apis.Core => 179
	i64 u0x9732d8dbddea3d9a, ; 678: id/Microsoft.Maui.Controls.resources => 360
	i64 u0x978be80e5210d31b, ; 679: Microsoft.Maui.Graphics.dll => 199
	i64 u0x979ab54025cc1c7f, ; 680: lib_Xamarin.GooglePlayServices.Base.dll.so => 323
	i64 u0x97a7d96b96967bc2, ; 681: lib_Firebase.Auth.dll.so => 176
	i64 u0x97b8c771ea3e4220, ; 682: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 683: System.Collections.Concurrent.dll => 8
	i64 u0x97e55f96df4ddd72, ; 684: lib_Xamarin.Firebase.Annotations.dll.so => 300
	i64 u0x984184e3c70d4419, ; 685: GoogleGson => 180
	i64 u0x9843944103683dd3, ; 686: Xamarin.AndroidX.Core.Core.Ktx => 229
	i64 u0x98b05cc81e6f333c, ; 687: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 285
	i64 u0x98d720cc4597562c, ; 688: System.Security.Cryptography.OpenSsl => 123
	i64 u0x991d510397f92d9d, ; 689: System.Linq.Expressions => 58
	i64 u0x996ceeb8a3da3d67, ; 690: System.Threading.Overlapped.dll => 140
	i64 u0x999cb19e1a04ffd3, ; 691: CommunityToolkit.Mvvm.dll => 175
	i64 u0x99a00ca5270c6878, ; 692: Xamarin.AndroidX.Navigation.Runtime => 276
	i64 u0x99cdc6d1f2d3a72f, ; 693: ko/Microsoft.Maui.Controls.resources.dll => 363
	i64 u0x9a01b1da98b6ee10, ; 694: Xamarin.AndroidX.Lifecycle.Runtime.dll => 263
	i64 u0x9a5ccc274fd6e6ee, ; 695: Jsr305Binding.dll => 316
	i64 u0x9ae6940b11c02876, ; 696: lib_Xamarin.AndroidX.Window.dll.so => 298
	i64 u0x9b211a749105beac, ; 697: System.Transactions.Local => 149
	i64 u0x9b8734714671022d, ; 698: System.Threading.Tasks.Dataflow.dll => 141
	i64 u0x9bc6aea27fbf034f, ; 699: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 340
	i64 u0x9bd8cc74558ad4c7, ; 700: Xamarin.KotlinX.AtomicFU => 337
	i64 u0x9c244ac7cda32d26, ; 701: System.Security.Cryptography.X509Certificates.dll => 125
	i64 u0x9c465f280cf43733, ; 702: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 339
	i64 u0x9c4dd9126a77a711, ; 703: Xamarin.Firebase.Installations.InterOp => 309
	i64 u0x9c8f6872beab6408, ; 704: System.Xml.XPath.XDocument.dll => 159
	i64 u0x9ce01cf91101ae23, ; 705: System.Xml.XmlDocument => 161
	i64 u0x9d128180c81d7ce6, ; 706: Xamarin.AndroidX.CustomView.PoolingContainer => 233
	i64 u0x9d5dbcf5a48583fe, ; 707: lib_Xamarin.AndroidX.Activity.dll.so => 210
	i64 u0x9d74dee1a7725f34, ; 708: Microsoft.Extensions.Configuration.Abstractions.dll => 182
	i64 u0x9de64d56c52fba95, ; 709: Xamarin.Firebase.Encoders.Proto => 306
	i64 u0x9e4534b6adaf6e84, ; 710: nl/Microsoft.Maui.Controls.resources => 366
	i64 u0x9e4b95dec42769f7, ; 711: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 712: Xamarin.AndroidX.Navigation.Common.dll => 274
	i64 u0x9ec0526f2213cdea, ; 713: lib_Xamarin.AndroidX.DataStore.Preferences.Core.dll.so => 243
	i64 u0x9ef542cf1f78c506, ; 714: Xamarin.AndroidX.Lifecycle.LiveData.Core => 260
	i64 u0xa00832eb975f56a8, ; 715: lib_System.Net.dll.so => 81
	i64 u0xa06cad7ee4c8bd5c, ; 716: lib_Xamarin.AndroidX.DataStore.Preferences.External.Protobuf.dll.so => 245
	i64 u0xa088c6d6689b264d, ; 717: Firebase.Auth.dll => 176
	i64 u0xa0ad78236b7b267f, ; 718: Xamarin.AndroidX.Window => 298
	i64 u0xa0d8259f4cc284ec, ; 719: lib_System.Security.Cryptography.dll.so => 126
	i64 u0xa0e17ca50c77a225, ; 720: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 317
	i64 u0xa0ff9b3e34d92f11, ; 721: lib_System.Resources.Writer.dll.so => 100
	i64 u0xa12fbfb4da97d9f3, ; 722: System.Threading.Timer.dll => 147
	i64 u0xa1440773ee9d341e, ; 723: Xamarin.Google.Android.Material => 315
	i64 u0xa1b9d7c27f47219f, ; 724: Xamarin.AndroidX.Navigation.UI.dll => 277
	i64 u0xa2572680829d2c7c, ; 725: System.IO.Pipelines.dll => 53
	i64 u0xa26597e57ee9c7f6, ; 726: System.Xml.XmlDocument.dll => 161
	i64 u0xa308401900e5bed3, ; 727: lib_mscorlib.dll.so => 166
	i64 u0xa35ba4fa358160a0, ; 728: Xamarin.KotlinX.Serialization.Protobuf.Jvm => 346
	i64 u0xa395572e7da6c99d, ; 729: lib_System.Security.dll.so => 130
	i64 u0xa3e683f24b43af6f, ; 730: System.Dynamic.Runtime.dll => 36
	i64 u0xa4145becdee3dc4f, ; 731: Xamarin.AndroidX.VectorDrawable.Animated => 294
	i64 u0xa46aa1eaa214539b, ; 732: ko/Microsoft.Maui.Controls.resources => 363
	i64 u0xa4a372eecb9e4df0, ; 733: Microsoft.Extensions.Diagnostics => 186
	i64 u0xa4d20d2ff0563d26, ; 734: lib_CommunityToolkit.Mvvm.dll.so => 175
	i64 u0xa4edc8f2ceae241a, ; 735: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 736: System.Runtime.Serialization.Formatters.dll => 111
	i64 u0xa54b74df83dce92b, ; 737: System.Reflection.DispatchProxy => 89
	i64 u0xa579ed010d7e5215, ; 738: Xamarin.AndroidX.DocumentFile => 247
	i64 u0xa5b7152421ed6d98, ; 739: lib_System.IO.FileSystem.Watcher.dll.so => 49
	i64 u0xa5c3844f17b822db, ; 740: lib_System.Linq.Parallel.dll.so => 59
	i64 u0xa5ce5c755bde8cb8, ; 741: lib_System.Security.Cryptography.Csp.dll.so => 121
	i64 u0xa5e599d1e0524750, ; 742: System.Numerics.Vectors.dll => 82
	i64 u0xa5f1ba49b85dd355, ; 743: System.Security.Cryptography.dll => 126
	i64 u0xa61975a5a37873ea, ; 744: lib_System.Xml.XmlSerializer.dll.so => 162
	i64 u0xa6593e21584384d2, ; 745: lib_Jsr305Binding.dll.so => 316
	i64 u0xa66cbee0130865f7, ; 746: lib_WindowsBase.dll.so => 165
	i64 u0xa67dbee13e1df9ca, ; 747: Xamarin.AndroidX.SavedState.dll => 284
	i64 u0xa684b098dd27b296, ; 748: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 286
	i64 u0xa68a420042bb9b1f, ; 749: Xamarin.AndroidX.DrawerLayout.dll => 248
	i64 u0xa6d26156d1cacc7c, ; 750: Xamarin.Android.Glide.dll => 206
	i64 u0xa75386b5cb9595aa, ; 751: Xamarin.AndroidX.Lifecycle.Runtime.Android => 264
	i64 u0xa763fbb98df8d9fb, ; 752: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 753: Xamarin.AndroidX.Lifecycle.Common.Jvm => 258
	i64 u0xa7a08e0f3bd00c3e, ; 754: Xamarin.Firebase.Messaging.dll => 311
	i64 u0xa7c31b56b4dc7b33, ; 755: hu/Microsoft.Maui.Controls.resources => 359
	i64 u0xa7eab29ed44b4e7a, ; 756: Mono.Android.Export => 169
	i64 u0xa8195217cbf017b7, ; 757: Microsoft.VisualBasic.Core => 2
	i64 u0xa843f6095f0d247d, ; 758: Xamarin.GooglePlayServices.Base.dll => 323
	i64 u0xa859a95830f367ff, ; 759: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 269
	i64 u0xa8b52f21e0dbe690, ; 760: System.Runtime.Serialization.dll => 115
	i64 u0xa8c84ce526c2b4bd, ; 761: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 384
	i64 u0xa8ee4ed7de2efaee, ; 762: Xamarin.AndroidX.Annotation.dll => 212
	i64 u0xa95590e7c57438a4, ; 763: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 764: CommunityToolkit.Maui.Core.dll => 174
	i64 u0xa9fdee8124cd90c8, ; 765: Xamarin.AndroidX.DataStore.Preferences.Core.dll => 243
	i64 u0xaa2219c8e3449ff5, ; 766: Microsoft.Extensions.Logging.Abstractions => 190
	i64 u0xaa443ac34067eeef, ; 767: System.Private.Xml.dll => 88
	i64 u0xaa52de307ef5d1dd, ; 768: System.Net.Http => 64
	i64 u0xaa5a5b578d0ae58e, ; 769: Xamarin.AndroidX.DataStore.Core.OkIO => 239
	i64 u0xaa9a7b0214a5cc5c, ; 770: System.Diagnostics.StackTrace.dll => 29
	i64 u0xaaaf86367285a918, ; 771: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 185
	i64 u0xaaf84bb3f052a265, ; 772: el/Microsoft.Maui.Controls.resources => 352
	i64 u0xab9af77b5b67a0b8, ; 773: Xamarin.AndroidX.ConstraintLayout.Core => 226
	i64 u0xab9c1b2687d86b0b, ; 774: lib_System.Linq.Expressions.dll.so => 58
	i64 u0xabf1181ab6564ab9, ; 775: lib_Xamarin.AndroidX.DataStore.Preferences.Android.dll.so => 242
	i64 u0xac2af3fa195a15ce, ; 776: System.Runtime.Numerics => 110
	i64 u0xac5376a2a538dc10, ; 777: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 260
	i64 u0xac5acae88f60357e, ; 778: System.Diagnostics.Tools.dll => 31
	i64 u0xac79c7e46047ad98, ; 779: System.Security.Principal.Windows.dll => 127
	i64 u0xac98d31068e24591, ; 780: System.Xml.XDocument => 158
	i64 u0xacd46e002c3ccb97, ; 781: ro/Microsoft.Maui.Controls.resources => 370
	i64 u0xacda2fab67639416, ; 782: Xamarin.Firebase.Installations => 308
	i64 u0xacdd9e4180d56dda, ; 783: Xamarin.AndroidX.Concurrent.Futures => 224
	i64 u0xacf42eea7ef9cd12, ; 784: System.Threading.Channels => 139
	i64 u0xad7e82ed3b0f16d0, ; 785: lib_Xamarin.AndroidX.DocumentFile.dll.so => 247
	i64 u0xad89c07347f1bad6, ; 786: nl/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0xadbb53caf78a79d2, ; 787: System.Web.HttpUtility => 152
	i64 u0xadc90ab061a9e6e4, ; 788: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 789: Xamarin.AndroidX.Collection.Ktx => 223
	i64 u0xadd8eda2edf396ad, ; 790: Xamarin.Android.Glide.GifDecoder => 209
	i64 u0xadf4cf30debbeb9a, ; 791: System.Net.ServicePoint.dll => 74
	i64 u0xadf511667bef3595, ; 792: System.Net.Security => 73
	i64 u0xae0aaa94fdcfce0f, ; 793: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 794: Java.Interop => 168
	i64 u0xae53579c90db1107, ; 795: System.ObjectModel.dll => 84
	i64 u0xaeb080014622ef84, ; 796: Xamarin.JavaX.Inject => 329
	i64 u0xaec7c0c7e2ed4575, ; 797: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 338
	i64 u0xaf732d0b2193b8f5, ; 798: System.Security.Cryptography.OpenSsl.dll => 123
	i64 u0xafdb94dbccd9d11c, ; 799: Xamarin.AndroidX.Lifecycle.LiveData.dll => 259
	i64 u0xafe29f45095518e7, ; 800: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 270
	i64 u0xb03ae931fb25607e, ; 801: Xamarin.AndroidX.ConstraintLayout => 225
	i64 u0xb05cc42cd94c6d9d, ; 802: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0xb0ac21bec8f428c5, ; 803: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 266
	i64 u0xb0bb43dc52ea59f9, ; 804: System.Diagnostics.Tracing.dll => 33
	i64 u0xb1dd05401aa8ee63, ; 805: System.Security.AccessControl => 117
	i64 u0xb220631954820169, ; 806: System.Text.RegularExpressions => 138
	i64 u0xb2376e1dbf8b4ed7, ; 807: System.Security.Cryptography.Csp => 121
	i64 u0xb2a1959fe95c5402, ; 808: lib_System.Runtime.InteropServices.JavaScript.dll.so => 105
	i64 u0xb2a3f67f3bf29fce, ; 809: da/Microsoft.Maui.Controls.resources => 350
	i64 u0xb3005ac9c8a035c5, ; 810: lib_Xamarin.JavaX.Inject.dll.so => 329
	i64 u0xb3011a0a57f7ffb2, ; 811: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 382
	i64 u0xb34f09b530d826d6, ; 812: Xamarin.AndroidX.NavigationEvent.dll => 278
	i64 u0xb363b43eeec5798e, ; 813: lib_Xamarin.Firebase.Iid.Interop.dll.so => 307
	i64 u0xb3874072ee0ecf8c, ; 814: Xamarin.AndroidX.VectorDrawable.Animated.dll => 294
	i64 u0xb3a26975fd90783b, ; 815: lib_Xamarin.AndroidX.DataStore.Core.Android.dll.so => 237
	i64 u0xb3f0a0fcda8d3ebc, ; 816: Xamarin.AndroidX.CardView => 220
	i64 u0xb46be1aa6d4fff93, ; 817: hi/Microsoft.Maui.Controls.resources => 357
	i64 u0xb477491be13109d8, ; 818: ar/Microsoft.Maui.Controls.resources => 347
	i64 u0xb4bd7015ecee9d86, ; 819: System.IO.Pipelines => 53
	i64 u0xb4c53d9749c5f226, ; 820: lib_System.IO.FileSystem.AccessControl.dll.so => 46
	i64 u0xb4ff710863453fda, ; 821: System.Diagnostics.FileVersionInfo.dll => 27
	i64 u0xb5c38bf497a4cfe2, ; 822: lib_System.Threading.Tasks.dll.so => 144
	i64 u0xb5c7fcdafbc67ee4, ; 823: Microsoft.Extensions.Logging.Abstractions.dll => 190
	i64 u0xb5e2ea1bb00704d6, ; 824: Xamarin.Kotlin.StdLib.Jdk7.dll => 335
	i64 u0xb5ea31d5244c6626, ; 825: System.Threading.ThreadPool.dll => 146
	i64 u0xb7212c4683a94afe, ; 826: System.Drawing.Primitives => 34
	i64 u0xb7b7753d1f319409, ; 827: sv/Microsoft.Maui.Controls.resources => 373
	i64 u0xb81a2c6e0aee50fe, ; 828: lib_System.Private.CoreLib.dll.so => 172
	i64 u0xb872c26142d22aa9, ; 829: Microsoft.Extensions.Http.dll => 188
	i64 u0xb898d1802c1a108c, ; 830: lib_System.Management.dll.so => 205
	i64 u0xb8b0a9b3dfbc5cb7, ; 831: Xamarin.AndroidX.Window.Extensions.Core.Core => 299
	i64 u0xb8c60af47c08d4da, ; 832: System.Net.ServicePoint => 74
	i64 u0xb8e68d20aad91196, ; 833: lib_System.Xml.XPath.dll.so => 160
	i64 u0xb9185c33a1643eed, ; 834: Microsoft.CSharp.dll => 1
	i64 u0xb960d6b2200ba320, ; 835: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 271
	i64 u0xb97187307f9dba5e, ; 836: Xamarin.KotlinX.Coroutines.Play.Services.dll => 342
	i64 u0xb9b8001adf4ed7cc, ; 837: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 287
	i64 u0xb9f64d3b230def68, ; 838: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0xb9fc3c8a556e3691, ; 839: ja/Microsoft.Maui.Controls.resources => 362
	i64 u0xba4670aa94a2b3c6, ; 840: lib_System.Xml.XDocument.dll.so => 158
	i64 u0xba48785529705af9, ; 841: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 842: lib_System.Windows.dll.so => 154
	i64 u0xbb286883bc35db36, ; 843: System.Transactions.dll => 150
	i64 u0xbb65706fde942ce3, ; 844: System.Net.Sockets => 75
	i64 u0xbba28979413cad9e, ; 845: lib_System.Runtime.CompilerServices.VisualC.dll.so => 102
	i64 u0xbbd180354b67271a, ; 846: System.Runtime.Serialization.Formatters => 111
	i64 u0xbc260cdba33291a3, ; 847: Xamarin.AndroidX.Arch.Core.Common.dll => 217
	i64 u0xbc727ece861e474e, ; 848: lib_Square.OkIO.JVM.dll.so => 202
	i64 u0xbd0e2c0d55246576, ; 849: System.Net.Http.dll => 64
	i64 u0xbd3fbd85b9e1cb29, ; 850: lib_System.Net.HttpListener.dll.so => 65
	i64 u0xbd437a2cdb333d0d, ; 851: Xamarin.AndroidX.ViewPager2 => 297
	i64 u0xbd4f572d2bd0a789, ; 852: System.IO.Compression.ZipFile.dll => 44
	i64 u0xbd5d0b88d3d647a5, ; 853: lib_Xamarin.AndroidX.Browser.dll.so => 219
	i64 u0xbd877b14d0b56392, ; 854: System.Runtime.Intrinsics.dll => 108
	i64 u0xbd960c672af2c51e, ; 855: Xamarin.GooglePlayServices.Stats => 327
	i64 u0xbe65a49036345cf4, ; 856: lib_System.Buffers.dll.so => 7
	i64 u0xbea7a9f0928f9e9b, ; 857: Xamarin.KotlinX.Serialization.Protobuf.dll => 345
	i64 u0xbee38d4a88835966, ; 858: Xamarin.AndroidX.AppCompat.AppCompatResources => 216
	i64 u0xbef9919db45b4ca7, ; 859: System.IO.Pipes.AccessControl => 54
	i64 u0xbf0fa68611139208, ; 860: lib_Xamarin.AndroidX.Annotation.dll.so => 212
	i64 u0xbfc1e1fb3095f2b3, ; 861: lib_System.Net.Http.Json.dll.so => 63
	i64 u0xc040a4ab55817f58, ; 862: ar/Microsoft.Maui.Controls.resources.dll => 347
	i64 u0xc07cadab29efeba0, ; 863: Xamarin.AndroidX.Core.Core.Ktx.dll => 229
	i64 u0xc0d928351ab5ca77, ; 864: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 865: System.Runtime.Intrinsics => 108
	i64 u0xc111030af54d7191, ; 866: System.Resources.Writer => 100
	i64 u0xc12b8b3afa48329c, ; 867: lib_System.Linq.dll.so => 61
	i64 u0xc183ca0b74453aa9, ; 868: lib_System.Threading.Tasks.Dataflow.dll.so => 141
	i64 u0xc1ff9ae3cdb6e1e6, ; 869: Xamarin.AndroidX.Activity.dll => 210
	i64 u0xc26c064effb1dea9, ; 870: System.Buffers.dll => 7
	i64 u0xc2850fbba221599d, ; 871: lib_Google.Apis.Core.dll.so => 179
	i64 u0xc28c50f32f81cc73, ; 872: ja/Microsoft.Maui.Controls.resources.dll => 362
	i64 u0xc2902f6cf5452577, ; 873: lib_Mono.Android.Export.dll.so => 169
	i64 u0xc2a3bca55b573141, ; 874: System.IO.FileSystem.Watcher => 49
	i64 u0xc2bcfec99f69365e, ; 875: Xamarin.AndroidX.ViewPager2.dll => 297
	i64 u0xc30b52815b58ac2c, ; 876: lib_System.Runtime.Serialization.Xml.dll.so => 114
	i64 u0xc36d7d89c652f455, ; 877: System.Threading.Overlapped => 140
	i64 u0xc396b285e59e5493, ; 878: GoogleGson.dll => 180
	i64 u0xc3c86c1e5e12f03d, ; 879: WindowsBase => 165
	i64 u0xc421b61fd853169d, ; 880: lib_System.Net.WebSockets.Client.dll.so => 79
	i64 u0xc4628cb75a5204b4, ; 881: lib_Xamarin.GooglePlayServices.CloudMessaging.dll.so => 325
	i64 u0xc463e077917aa21d, ; 882: System.Runtime.Serialization.Json => 112
	i64 u0xc4d3858ed4d08512, ; 883: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 270
	i64 u0xc50fded0ded1418c, ; 884: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 885: lib_System.Net.Requests.dll.so => 72
	i64 u0xc5293b19e4dc230e, ; 886: Xamarin.AndroidX.Navigation.Fragment => 275
	i64 u0xc5325b2fcb37446f, ; 887: lib_System.Private.Xml.dll.so => 88
	i64 u0xc535cb9a21385d9b, ; 888: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 208
	i64 u0xc5a0f4b95a699af7, ; 889: lib_System.Private.Uri.dll.so => 86
	i64 u0xc5c7ca48b9e248a9, ; 890: lib_Xamarin.KotlinX.Serialization.Protobuf.dll.so => 345
	i64 u0xc5cdcd5b6277579e, ; 891: lib_System.Security.Cryptography.Algorithms.dll.so => 119
	i64 u0xc5d608afb58abba2, ; 892: Google.Apis.Auth.dll => 178
	i64 u0xc5ec286825cb0bf4, ; 893: Xamarin.AndroidX.Tracing.Tracing => 290
	i64 u0xc6706bc8aa7fe265, ; 894: Xamarin.AndroidX.Annotation.Jvm => 214
	i64 u0xc7c01e7d7c93a110, ; 895: System.Text.Encoding.Extensions.dll => 134
	i64 u0xc7ce851898a4548e, ; 896: lib_System.Web.HttpUtility.dll.so => 152
	i64 u0xc809d4089d2556b2, ; 897: System.Runtime.InteropServices.JavaScript.dll => 105
	i64 u0xc858a28d9ee5a6c5, ; 898: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc8ac7c6bf1c2ec51, ; 899: System.Reflection.DispatchProxy.dll => 89
	i64 u0xc9c62c8f354ac568, ; 900: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 30
	i64 u0xc9e54b32fc19baf3, ; 901: lib_CommunityToolkit.Maui.dll.so => 173
	i64 u0xca13894924892aa4, ; 902: Xamarin.AndroidX.DataStore.Core.Android.dll => 237
	i64 u0xca3a723e7342c5b6, ; 903: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0xca5801070d9fccfb, ; 904: System.Text.Encoding => 135
	i64 u0xcab3493c70141c2d, ; 905: pl/Microsoft.Maui.Controls.resources => 367
	i64 u0xcacfddc9f7c6de76, ; 906: ro/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0xcadbc92899a777f0, ; 907: Xamarin.AndroidX.Startup.StartupRuntime => 288
	i64 u0xcba1cb79f45292b5, ; 908: Xamarin.Android.Glide.GifDecoder.dll => 209
	i64 u0xcbb5f80c7293e696, ; 909: lib_System.Globalization.Calendars.dll.so => 39
	i64 u0xcbd4fdd9cef4a294, ; 910: lib__Microsoft.Android.Resource.Designer.dll.so => 385
	i64 u0xcc15da1e07bbd994, ; 911: Xamarin.AndroidX.SlidingPaneLayout => 287
	i64 u0xcc2876b32ef2794c, ; 912: lib_System.Text.RegularExpressions.dll.so => 138
	i64 u0xcc5c3bb714c4561e, ; 913: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 341
	i64 u0xcc76886e09b88260, ; 914: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 344
	i64 u0xcc9fa2923aa1c9ef, ; 915: System.Diagnostics.Contracts.dll => 25
	i64 u0xccc43844b5436ad5, ; 916: Xamarin.AndroidX.DataStore.Core.Jvm.dll => 238
	i64 u0xccf25c4b634ccd3a, ; 917: zh-Hans/Microsoft.Maui.Controls.resources.dll => 379
	i64 u0xccfa852474d5fcde, ; 918: lib_Xamarin.KotlinX.Serialization.Protobuf.Jvm.dll.so => 346
	i64 u0xcd10a42808629144, ; 919: System.Net.Requests => 72
	i64 u0xcdca1b920e9f53ba, ; 920: Xamarin.AndroidX.Interpolator => 255
	i64 u0xcdd0c48b6937b21c, ; 921: Xamarin.AndroidX.SwipeRefreshLayout => 289
	i64 u0xcde1fa22dc303670, ; 922: Microsoft.VisualStudio.DesignTools.XamlTapContract => 384
	i64 u0xcf1f7a2359f1a539, ; 923: Xamarin.JavaX.Inject.dll => 329
	i64 u0xcf23d8093f3ceadf, ; 924: System.Diagnostics.DiagnosticSource.dll => 204
	i64 u0xcf5ff6b6b2c4c382, ; 925: System.Net.Mail.dll => 66
	i64 u0xcf8fc898f98b0d34, ; 926: System.Private.Xml.Linq => 87
	i64 u0xcfb655dfff1cb2eb, ; 927: Xamarin.AndroidX.DataStore.Core.Android => 237
	i64 u0xd04b5f59ed596e31, ; 928: System.Reflection.Metadata.dll => 94
	i64 u0xd063299fcfc0c93f, ; 929: lib_System.Runtime.Serialization.Json.dll.so => 112
	i64 u0xd07eb0f20de63ff6, ; 930: Xamarin.Firebase.Encoders.JSON => 305
	i64 u0xd0de8a113e976700, ; 931: System.Diagnostics.TextWriterTraceListener => 30
	i64 u0xd0fc33d5ae5d4cb8, ; 932: System.Runtime.Extensions => 103
	i64 u0xd1194e1d8a8de83c, ; 933: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 258
	i64 u0xd12beacdfc14f696, ; 934: System.Dynamic.Runtime => 36
	i64 u0xd16fd7fb9bbcd43e, ; 935: Microsoft.Extensions.Diagnostics.Abstractions => 187
	i64 u0xd198e7ce1b6a8344, ; 936: System.Net.Quic.dll => 71
	i64 u0xd3144156a3727ebe, ; 937: Xamarin.Google.Guava.ListenableFuture => 319
	i64 u0xd333d0af9e423810, ; 938: System.Runtime.InteropServices => 107
	i64 u0xd33a415cb4278969, ; 939: System.Security.Cryptography.Encoding.dll => 122
	i64 u0xd3426d966bb704f5, ; 940: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 216
	i64 u0xd3651b6fc3125825, ; 941: System.Private.Uri.dll => 86
	i64 u0xd373685349b1fe8b, ; 942: Microsoft.Extensions.Logging.dll => 189
	i64 u0xd3801faafafb7698, ; 943: System.Private.DataContractSerialization.dll => 85
	i64 u0xd3e4c8d6a2d5d470, ; 944: it/Microsoft.Maui.Controls.resources => 361
	i64 u0xd3edcc1f25459a50, ; 945: System.Reflection.Emit => 92
	i64 u0xd4645626dffec99d, ; 946: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 185
	i64 u0xd4755510f93c31a7, ; 947: Xamarin.GooglePlayServices.Auth.dll => 320
	i64 u0xd4fa0abb79079ea9, ; 948: System.Security.Principal.dll => 128
	i64 u0xd5507e11a2b2839f, ; 949: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 270
	i64 u0xd5d04bef8478ea19, ; 950: Xamarin.AndroidX.Tracing.Tracing.dll => 290
	i64 u0xd60815f26a12e140, ; 951: Microsoft.Extensions.Logging.Debug.dll => 191
	i64 u0xd65786d27a4ad960, ; 952: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 381
	i64 u0xd6694f8359737e4e, ; 953: Xamarin.AndroidX.SavedState => 284
	i64 u0xd6949e129339eae5, ; 954: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 229
	i64 u0xd6d21782156bc35b, ; 955: Xamarin.AndroidX.SwipeRefreshLayout.dll => 289
	i64 u0xd6de019f6af72435, ; 956: Xamarin.AndroidX.ConstraintLayout.Core.dll => 226
	i64 u0xd6f6d366d4896aef, ; 957: lib_Xamarin.AndroidX.NavigationEvent.Android.dll.so => 279
	i64 u0xd70956d1e6deefb9, ; 958: Jsr305Binding => 316
	i64 u0xd72329819cbbbc44, ; 959: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 182
	i64 u0xd72c760af136e863, ; 960: System.Xml.XmlSerializer.dll => 162
	i64 u0xd753f071e44c2a03, ; 961: lib_System.Security.SecureString.dll.so => 129
	i64 u0xd7b3764ada9d341d, ; 962: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 190
	i64 u0xd7dfd89d34e8dd1d, ; 963: Square.OkIO => 201
	i64 u0xd7f0088bc5ad71f2, ; 964: Xamarin.AndroidX.VersionedParcelable => 295
	i64 u0xd8113d9a7e8ad136, ; 965: System.CodeDom => 203
	i64 u0xd8fb25e28ae30a12, ; 966: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 281
	i64 u0xda1dfa4c534a9251, ; 967: Microsoft.Extensions.DependencyInjection => 184
	i64 u0xdab94026b007e005, ; 968: Xamarin.GooglePlayServices.Auth.Api.Phone.dll => 321
	i64 u0xdad05a11827959a3, ; 969: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 970: System.IO.FileSystem.Primitives => 48
	i64 u0xdb5383ab5865c007, ; 971: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 377
	i64 u0xdb58816721c02a59, ; 972: lib_System.Reflection.Emit.ILGeneration.dll.so => 90
	i64 u0xdb7c660dc42f02f5, ; 973: Xamarin.AndroidX.DataStore.Core.OkIO.Jvm => 240
	i64 u0xdbeda89f832aa805, ; 974: vi/Microsoft.Maui.Controls.resources.dll => 377
	i64 u0xdbf2a779fbc3ac31, ; 975: System.Transactions.Local.dll => 149
	i64 u0xdbf9607a441b4505, ; 976: System.Linq => 61
	i64 u0xdbfc90157a0de9b0, ; 977: lib_System.Text.Encoding.dll.so => 135
	i64 u0xdc75032002d1a212, ; 978: lib_System.Transactions.Local.dll.so => 149
	i64 u0xdca8be7403f92d4f, ; 979: lib_System.Linq.Queryable.dll.so => 60
	i64 u0xdcbd21904ff0f297, ; 980: Google.Apis => 177
	i64 u0xdce2c53525640bf3, ; 981: Microsoft.Extensions.Logging => 189
	i64 u0xdd2b722d78ef5f43, ; 982: System.Runtime.dll => 116
	i64 u0xdd67031857c72f96, ; 983: lib_System.Text.Encodings.Web.dll.so => 136
	i64 u0xdd70765ad6162057, ; 984: Xamarin.JSpecify => 331
	i64 u0xdd92e229ad292030, ; 985: System.Numerics.dll => 83
	i64 u0xdddcdd701e911af1, ; 986: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 256
	i64 u0xdde30e6b77aa6f6c, ; 987: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 379
	i64 u0xde110ae80fa7c2e2, ; 988: System.Xml.XDocument.dll => 158
	i64 u0xde4726fcdf63a198, ; 989: Xamarin.AndroidX.Transition => 292
	i64 u0xde572c2b2fb32f93, ; 990: lib_System.Threading.Tasks.Extensions.dll.so => 142
	i64 u0xde8769ebda7d8647, ; 991: hr/Microsoft.Maui.Controls.resources.dll => 358
	i64 u0xdee075f3477ef6be, ; 992: Xamarin.AndroidX.ExifInterface.dll => 252
	i64 u0xdf4b773de8fb1540, ; 993: System.Net.dll => 81
	i64 u0xdfa254ebb4346068, ; 994: System.Net.Ping => 69
	i64 u0xdffc7beab3783e65, ; 995: lib_Xamarin.GooglePlayServices.Auth.Base.dll.so => 322
	i64 u0xe0142572c095a480, ; 996: Xamarin.AndroidX.AppCompat.dll => 215
	i64 u0xe021eaa401792a05, ; 997: System.Text.Encoding.dll => 135
	i64 u0xe02f89350ec78051, ; 998: Xamarin.AndroidX.CoordinatorLayout.dll => 227
	i64 u0xe03ac59b394077a7, ; 999: lib_Xamarin.Firebase.Messaging.dll.so => 311
	i64 u0xe0496b9d65ef5474, ; 1000: Xamarin.Android.Glide.DiskLruCache.dll => 208
	i64 u0xe0eaacf736cd6fce, ; 1001: Xamarin.GooglePlayServices.Fido.dll => 326
	i64 u0xe10b760bb1462e7a, ; 1002: lib_System.Security.Cryptography.Primitives.dll.so => 124
	i64 u0xe14ff8e84737288a, ; 1003: Xamarin.Firebase.Installations.InterOp.dll => 309
	i64 u0xe1566bbdb759c5af, ; 1004: Microsoft.Maui.Controls.HotReload.Forms.dll => 381
	i64 u0xe192a588d4410686, ; 1005: lib_System.IO.Pipelines.dll.so => 53
	i64 u0xe1a08bd3fa539e0d, ; 1006: System.Runtime.Loader => 109
	i64 u0xe1a77eb8831f7741, ; 1007: System.Security.SecureString.dll => 129
	i64 u0xe1b52f9f816c70ef, ; 1008: System.Private.Xml.Linq.dll => 87
	i64 u0xe1e199c8ab02e356, ; 1009: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1010: System.Net.Security.dll => 73
	i64 u0xe2252a80fe853de4, ; 1011: lib_System.Security.Principal.dll.so => 128
	i64 u0xe22fa4c9c645db62, ; 1012: System.Diagnostics.TextWriterTraceListener.dll => 30
	i64 u0xe2420585aeceb728, ; 1013: System.Net.Requests.dll => 72
	i64 u0xe26692647e6bcb62, ; 1014: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 265
	i64 u0xe29b73bc11392966, ; 1015: lib-id-Microsoft.Maui.Controls.resources.dll.so => 360
	i64 u0xe2ad448dee50fbdf, ; 1016: System.Xml.Serialization => 157
	i64 u0xe2d920f978f5d85c, ; 1017: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1018: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1019: Mono.Android.Export.dll => 169
	i64 u0xe3811d68d4fe8463, ; 1020: pt-BR/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0xe3b7cbae5ad66c75, ; 1021: lib_System.Security.Cryptography.Encoding.dll.so => 122
	i64 u0xe4292b48f3224d5b, ; 1022: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 230
	i64 u0xe494f7ced4ecd10a, ; 1023: hu/Microsoft.Maui.Controls.resources.dll => 359
	i64 u0xe4a9b1e40d1e8917, ; 1024: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 354
	i64 u0xe4dd7925d04f7f6b, ; 1025: lib_Xamarin.AndroidX.NavigationEvent.dll.so => 278
	i64 u0xe4f74a0b5bf9703f, ; 1026: System.Runtime.Serialization.Primitives => 113
	i64 u0xe5434e8a119ceb69, ; 1027: lib_Mono.Android.dll.so => 171
	i64 u0xe55703b9ce5c038a, ; 1028: System.Diagnostics.Tools => 31
	i64 u0xe57013c8afc270b5, ; 1029: Microsoft.VisualBasic => 3
	i64 u0xe62913cc36bc07ec, ; 1030: System.Xml.dll => 163
	i64 u0xe7bea09c4900a191, ; 1031: Xamarin.AndroidX.VectorDrawable.dll => 293
	i64 u0xe7e03cc18dcdeb49, ; 1032: lib_System.Diagnostics.StackTrace.dll.so => 29
	i64 u0xe7e147ff99a7a380, ; 1033: lib_System.Configuration.dll.so => 19
	i64 u0xe7ef84b36819564e, ; 1034: Xamarin.AndroidX.NavigationEvent.Android => 279
	i64 u0xe8397cf3948e7cb7, ; 1035: lib_Microsoft.Extensions.Options.ConfigurationExtensions.dll.so => 193
	i64 u0xe83ddbccfc6aff3f, ; 1036: Xamarin.Kotlin.StdLib.Jdk7 => 335
	i64 u0xe8419e0aa49ab54f, ; 1037: lib_Xamarin.GooglePlayServices.Fido.dll.so => 326
	i64 u0xe86b0df4ba9e5db8, ; 1038: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 264
	i64 u0xe896622fe0902957, ; 1039: System.Reflection.Emit.dll => 92
	i64 u0xe89a2a9ef110899b, ; 1040: System.Drawing.dll => 35
	i64 u0xe8c5f8c100b5934b, ; 1041: Microsoft.Win32.Registry => 5
	i64 u0xe957c3976986ab72, ; 1042: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 299
	i64 u0xe968ab252d3dda82, ; 1043: lib_Xamarin.Google.Android.DataTransport.TransportRuntime.dll.so => 314
	i64 u0xe98163eb702ae5c5, ; 1044: Xamarin.AndroidX.Arch.Core.Runtime => 218
	i64 u0xe994f23ba4c143e5, ; 1045: Xamarin.KotlinX.Coroutines.Android => 339
	i64 u0xe9b9c8c0458fd92a, ; 1046: System.Windows => 154
	i64 u0xe9d166d87a7f2bdb, ; 1047: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 288
	i64 u0xea5a4efc2ad81d1b, ; 1048: Xamarin.Google.ErrorProne.Annotations => 318
	i64 u0xeaf8e9970fc2fe69, ; 1049: System.Management => 205
	i64 u0xeb2313fe9d65b785, ; 1050: Xamarin.AndroidX.ConstraintLayout.dll => 225
	i64 u0xeb6e275e78cb8d42, ; 1051: Xamarin.AndroidX.LocalBroadcastManager.dll => 273
	i64 u0xeb710a05c0467d46, ; 1052: Xamarin.GooglePlayServices.CloudMessaging => 325
	i64 u0xeb9973cda26e858f, ; 1053: Xamarin.Firebase.Common.dll => 301
	i64 u0xeccb25154d9b4c63, ; 1054: lib_Xamarin.AndroidX.DataStore.Core.Jvm.dll.so => 238
	i64 u0xed19c616b3fcb7eb, ; 1055: Xamarin.AndroidX.VersionedParcelable.dll => 295
	i64 u0xed60c6fa891c051a, ; 1056: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 383
	i64 u0xedc4817167106c23, ; 1057: System.Net.Sockets.dll => 75
	i64 u0xedc632067fb20ff3, ; 1058: System.Memory.dll => 62
	i64 u0xedc8e4ca71a02a8b, ; 1059: Xamarin.AndroidX.Navigation.Runtime.dll => 276
	i64 u0xee81f5b3f1c4f83b, ; 1060: System.Threading.ThreadPool => 146
	i64 u0xeeb7ebb80150501b, ; 1061: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 222
	i64 u0xeefc635595ef57f0, ; 1062: System.Security.Cryptography.Cng => 120
	i64 u0xef03b1b5a04e9709, ; 1063: System.Text.Encoding.CodePages.dll => 133
	i64 u0xef432781d5667f61, ; 1064: Xamarin.AndroidX.Print => 280
	i64 u0xef5bcbe61622ee5f, ; 1065: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 291
	i64 u0xef602c523fe2e87a, ; 1066: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 319
	i64 u0xef72742e1bcca27a, ; 1067: Microsoft.Maui.Essentials.dll => 198
	i64 u0xefd1e0c4e5c9b371, ; 1068: System.Resources.ResourceManager.dll => 99
	i64 u0xefe8f8d5ed3c72ea, ; 1069: System.Formats.Tar.dll => 38
	i64 u0xefec0b7fdc57ec42, ; 1070: Xamarin.AndroidX.Activity => 210
	i64 u0xf008bcd238ede2c8, ; 1071: System.CodeDom.dll => 203
	i64 u0xf00c29406ea45e19, ; 1072: es/Microsoft.Maui.Controls.resources.dll => 353
	i64 u0xf09e47b6ae914f6e, ; 1073: System.Net.NameResolution => 67
	i64 u0xf0ac2b489fed2e35, ; 1074: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1075: lib_System.Net.ServicePoint.dll.so => 74
	i64 u0xf0de2537ee19c6ca, ; 1076: lib_System.Net.WebHeaderCollection.dll.so => 77
	i64 u0xf1138779fa181c68, ; 1077: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 263
	i64 u0xf11b621fc87b983f, ; 1078: Microsoft.Maui.Controls.Xaml.dll => 196
	i64 u0xf161f4f3c3b7e62c, ; 1079: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1080: System.ValueTuple => 151
	i64 u0xf1c4b4005493d871, ; 1081: System.Formats.Asn1.dll => 37
	i64 u0xf2039b1a33e63e8e, ; 1082: Xamarin.Google.Android.DataTransport.TransportApi.dll => 312
	i64 u0xf22514cfad2d598b, ; 1083: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 271
	i64 u0xf238bd79489d3a96, ; 1084: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0xf2a69492c6bd46b0, ; 1085: lib_Xamarin.Kotlin.StdLib.Jdk7.dll.so => 335
	i64 u0xf2feea356ba760af, ; 1086: Xamarin.AndroidX.Arch.Core.Runtime.dll => 218
	i64 u0xf300e085f8acd238, ; 1087: lib_System.ServiceProcess.dll.so => 132
	i64 u0xf308f385e3f3976f, ; 1088: Xamarin.AndroidX.DataStore.Core.Jvm => 238
	i64 u0xf33cd2d62dbe52f9, ; 1089: Xamarin.AndroidX.NavigationEvent => 278
	i64 u0xf34e52b26e7e059d, ; 1090: System.Runtime.CompilerServices.VisualC.dll => 102
	i64 u0xf37221fda4ef8830, ; 1091: lib_Xamarin.Google.Android.Material.dll.so => 315
	i64 u0xf3ad9b8fb3eefd12, ; 1092: lib_System.IO.UnmanagedMemoryStream.dll.so => 56
	i64 u0xf3ddfe05336abf29, ; 1093: System => 164
	i64 u0xf408654b2a135055, ; 1094: System.Reflection.Emit.ILGeneration.dll => 90
	i64 u0xf4103170a1de5bd0, ; 1095: System.Linq.Queryable.dll => 60
	i64 u0xf41e466d4e2ee203, ; 1096: Xamarin.AndroidX.DataStore.Preferences.Core => 243
	i64 u0xf42d20c23173d77c, ; 1097: lib_System.ServiceModel.Web.dll.so => 131
	i64 u0xf4c1dd70a5496a17, ; 1098: System.IO.Compression => 45
	i64 u0xf4ecf4b9afc64781, ; 1099: System.ServiceProcess.dll => 132
	i64 u0xf4eeeaa566e9b970, ; 1100: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 233
	i64 u0xf518f63ead11fcd1, ; 1101: System.Threading.Tasks => 144
	i64 u0xf5fc7602fe27b333, ; 1102: System.Net.WebHeaderCollection => 77
	i64 u0xf6077741019d7428, ; 1103: Xamarin.AndroidX.CoordinatorLayout => 227
	i64 u0xf60ebc39f5bec609, ; 1104: lib_Xamarin.AndroidX.DataStore.dll.so => 234
	i64 u0xf6742cbf457c450b, ; 1105: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 264
	i64 u0xf6f893f692f8cb43, ; 1106: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 193
	i64 u0xf70c0a7bf8ccf5af, ; 1107: System.Web => 153
	i64 u0xf73b506af603bfe1, ; 1108: lib_Square.OkIO.dll.so => 201
	i64 u0xf77b20923f07c667, ; 1109: de/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0xf7c38c072af2fe21, ; 1110: lib_Xamarin.GooglePlayServices.Auth.dll.so => 320
	i64 u0xf7e2cac4c45067b3, ; 1111: lib_System.Numerics.Vectors.dll.so => 82
	i64 u0xf7e74930e0e3d214, ; 1112: zh-HK/Microsoft.Maui.Controls.resources.dll => 378
	i64 u0xf7fa0bf77fe677cc, ; 1113: Newtonsoft.Json.dll => 200
	i64 u0xf8268d90a54506f7, ; 1114: Xamarin.AndroidX.DataStore.Android => 235
	i64 u0xf84773b5c81e3cef, ; 1115: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0xf8aac5ea82de1348, ; 1116: System.Linq.Queryable => 60
	i64 u0xf8b77539b362d3ba, ; 1117: lib_System.Reflection.Primitives.dll.so => 95
	i64 u0xf8cdc93c7cb624d0, ; 1118: Xamarin.GooglePlayServices.Auth.Base => 322
	i64 u0xf8dacc6dd9573437, ; 1119: Square.OkIO.dll => 201
	i64 u0xf8e045dc345b2ea3, ; 1120: lib_Xamarin.AndroidX.RecyclerView.dll.so => 282
	i64 u0xf915dc29808193a1, ; 1121: System.Web.HttpUtility.dll => 152
	i64 u0xf96c777a2a0686f4, ; 1122: hi/Microsoft.Maui.Controls.resources.dll => 357
	i64 u0xf9be54c8bcf8ff3b, ; 1123: System.Security.AccessControl.dll => 117
	i64 u0xf9eec5bb3a6aedc6, ; 1124: Microsoft.Extensions.Options => 192
	i64 u0xfa0e82300e67f913, ; 1125: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1126: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1127: lib_System.Net.Security.dll.so => 73
	i64 u0xfa5ed7226d978949, ; 1128: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 347
	i64 u0xfa645d91e9fc4cba, ; 1129: System.Threading.Thread => 145
	i64 u0xfad4d2c770e827f9, ; 1130: lib_System.IO.IsolatedStorage.dll.so => 51
	i64 u0xfb06dd2338e6f7c4, ; 1131: System.Net.Ping.dll => 69
	i64 u0xfb087abe5365e3b7, ; 1132: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1133: System.Xml.Serialization.dll => 157
	i64 u0xfbad3e4ce4b98145, ; 1134: System.Security.Cryptography.X509Certificates => 125
	i64 u0xfbf0a31c9fc34bc4, ; 1135: lib_System.Net.Http.dll.so => 64
	i64 u0xfc61ddcf78dd1f54, ; 1136: Xamarin.AndroidX.LocalBroadcastManager => 273
	i64 u0xfc6b7527cc280b3f, ; 1137: lib_System.Runtime.Serialization.Formatters.dll.so => 111
	i64 u0xfc719aec26adf9d9, ; 1138: Xamarin.AndroidX.Navigation.Fragment.dll => 275
	i64 u0xfc82690c2fe2735c, ; 1139: Xamarin.AndroidX.Lifecycle.Process.dll => 262
	i64 u0xfc93fc307d279893, ; 1140: System.IO.Pipes.AccessControl.dll => 54
	i64 u0xfcd302092ada6328, ; 1141: System.IO.MemoryMappedFiles.dll => 52
	i64 u0xfd22f00870e40ae0, ; 1142: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 248
	i64 u0xfd49b3c1a76e2748, ; 1143: System.Runtime.InteropServices.RuntimeInformation => 106
	i64 u0xfd536c702f64dc47, ; 1144: System.Text.Encoding.Extensions => 134
	i64 u0xfd583f7657b6a1cb, ; 1145: Xamarin.AndroidX.Fragment => 253
	i64 u0xfd8dd91a2c26bd5d, ; 1146: Xamarin.AndroidX.Lifecycle.Runtime => 263
	i64 u0xfda36abccf05cf5c, ; 1147: System.Net.WebSockets.Client => 79
	i64 u0xfdbe4710aa9beeff, ; 1148: CommunityToolkit.Maui => 173
	i64 u0xfdce9120d7a3b1d0, ; 1149: Xamarin.AndroidX.DataStore.Android.dll => 235
	i64 u0xfddbe9695626a7f5, ; 1150: Xamarin.AndroidX.Lifecycle.Common => 257
	i64 u0xfe558a076630bb1a, ; 1151: Xamarin.AndroidX.DataStore.Preferences.dll => 241
	i64 u0xfeae9952cf03b8cb, ; 1152: tr/Microsoft.Maui.Controls.resources => 375
	i64 u0xfebe1950717515f9, ; 1153: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 261
	i64 u0xff270a55858bac8d, ; 1154: System.Security.Principal => 128
	i64 u0xff9b54613e0d2cc8, ; 1155: System.Net.Http.Json => 63
	i64 u0xffb5607c2db1b7e8, ; 1156: Xamarin.Kotlin.StdLib.Jdk8 => 336
	i64 u0xffdb7a971be4ec73 ; 1157: System.ValueTuple.dll => 151
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1158 x i32] [
	i32 41, i32 340, i32 289, i32 236, i32 332, i32 13, i32 276, i32 174,
	i32 193, i32 104, i32 170, i32 245, i32 47, i32 215, i32 7, i32 85,
	i32 371, i32 349, i32 377, i32 249, i32 70, i32 328, i32 282, i32 12,
	i32 197, i32 101, i32 378, i32 155, i32 19, i32 254, i32 222, i32 160,
	i32 251, i32 293, i32 166, i32 239, i32 371, i32 10, i32 191, i32 294,
	i32 95, i32 233, i32 248, i32 13, i32 192, i32 10, i32 324, i32 126,
	i32 302, i32 94, i32 244, i32 139, i32 38, i32 372, i32 311, i32 344,
	i32 296, i32 245, i32 203, i32 368, i32 171, i32 209, i32 5, i32 198,
	i32 66, i32 286, i32 129, i32 240, i32 250, i32 67, i32 308, i32 223,
	i32 65, i32 56, i32 232, i32 51, i32 42, i32 124, i32 66, i32 80,
	i32 265, i32 383, i32 157, i32 91, i32 346, i32 98, i32 282, i32 322,
	i32 140, i32 150, i32 219, i32 355, i32 161, i32 168, i32 356, i32 300,
	i32 185, i32 80, i32 383, i32 331, i32 223, i32 4, i32 5, i32 50,
	i32 100, i32 55, i32 119, i32 97, i32 167, i32 117, i32 340, i32 21,
	i32 359, i32 136, i32 96, i32 333, i32 344, i32 76, i32 365, i32 280,
	i32 288, i32 118, i32 8, i32 164, i32 374, i32 69, i32 208, i32 266,
	i32 283, i32 186, i32 170, i32 304, i32 178, i32 144, i32 39, i32 286,
	i32 46, i32 29, i32 277, i32 363, i32 143, i32 192, i32 246, i32 162,
	i32 27, i32 83, i32 290, i32 76, i32 42, i32 28, i32 41, i32 102,
	i32 116, i32 213, i32 44, i32 90, i32 374, i32 55, i32 147, i32 382,
	i32 324, i32 145, i32 99, i32 48, i32 20, i32 228, i32 113, i32 178,
	i32 206, i32 355, i32 317, i32 334, i32 194, i32 93, i32 57, i32 360,
	i32 358, i32 80, i32 317, i32 168, i32 26, i32 309, i32 336, i32 70,
	i32 281, i32 187, i32 252, i32 381, i32 376, i32 68, i32 32, i32 354,
	i32 14, i32 138, i32 37, i32 380, i32 224, i32 313, i32 367, i32 133,
	i32 91, i32 87, i32 148, i32 246, i32 373, i32 24, i32 137, i32 56,
	i32 50, i32 352, i32 304, i32 28, i32 156, i32 33, i32 163, i32 188,
	i32 327, i32 310, i32 313, i32 253, i32 51, i32 176, i32 333, i32 385,
	i32 298, i32 89, i32 303, i32 305, i32 220, i32 34, i32 355, i32 156,
	i32 242, i32 9, i32 353, i32 75, i32 54, i32 197, i32 349, i32 304,
	i32 195, i32 13, i32 297, i32 181, i32 217, i32 108, i32 269, i32 31,
	i32 302, i32 103, i32 83, i32 91, i32 52, i32 236, i32 95, i32 330,
	i32 57, i32 9, i32 101, i32 232, i32 241, i32 67, i32 296, i32 348,
	i32 200, i32 124, i32 283, i32 115, i32 134, i32 285, i32 125, i32 105,
	i32 334, i32 130, i32 219, i32 319, i32 146, i32 155, i32 254, i32 228,
	i32 249, i32 234, i32 310, i32 283, i32 96, i32 24, i32 287, i32 142,
	i32 280, i32 274, i32 3, i32 166, i32 216, i32 99, i32 160, i32 98,
	i32 230, i32 25, i32 205, i32 92, i32 167, i32 171, i32 211, i32 3,
	i32 367, i32 291, i32 251, i32 1, i32 113, i32 334, i32 254, i32 262,
	i32 177, i32 32, i32 6, i32 371, i32 155, i32 342, i32 369, i32 52,
	i32 256, i32 321, i32 84, i32 301, i32 295, i32 277, i32 43, i32 261,
	i32 103, i32 46, i32 137, i32 202, i32 236, i32 271, i32 63, i32 306,
	i32 272, i32 68, i32 79, i32 58, i32 88, i32 153, i32 217, i32 132,
	i32 109, i32 361, i32 272, i32 281, i32 170, i32 133, i32 306, i32 139,
	i32 39, i32 348, i32 183, i32 195, i32 327, i32 59, i32 175, i32 183,
	i32 268, i32 78, i32 25, i32 35, i32 98, i32 265, i32 70, i32 22,
	i32 228, i32 199, i32 372, i32 120, i32 68, i32 106, i32 378, i32 273,
	i32 118, i32 116, i32 257, i32 179, i32 235, i32 258, i32 11, i32 2,
	i32 123, i32 333, i32 114, i32 314, i32 141, i32 40, i32 86, i32 212,
	i32 172, i32 204, i32 241, i32 147, i32 183, i32 362, i32 184, i32 318,
	i32 211, i32 1, i32 213, i32 43, i32 227, i32 148, i32 256, i32 18,
	i32 85, i32 350, i32 323, i32 40, i32 261, i32 221, i32 336, i32 266,
	i32 93, i32 189, i32 27, i32 40, i32 77, i32 250, i32 224, i32 143,
	i32 107, i32 222, i32 307, i32 11, i32 104, i32 246, i32 136, i32 16,
	i32 121, i32 65, i32 156, i32 22, i32 312, i32 352, i32 343, i32 101,
	i32 184, i32 341, i32 307, i32 62, i32 57, i32 196, i32 351, i32 109,
	i32 172, i32 384, i32 339, i32 9, i32 315, i32 119, i32 97, i32 303,
	i32 104, i32 342, i32 269, i32 173, i32 195, i32 110, i32 214, i32 48,
	i32 20, i32 303, i32 268, i32 231, i32 345, i32 71, i32 226, i32 313,
	i32 154, i32 38, i32 350, i32 34, i32 337, i32 37, i32 356, i32 299,
	i32 107, i32 321, i32 365, i32 21, i32 177, i32 330, i32 0, i32 267,
	i32 202, i32 199, i32 15, i32 194, i32 78, i32 78, i32 231, i32 194,
	i32 247, i32 275, i32 151, i32 21, i32 242, i32 308, i32 197, i32 349,
	i32 49, i32 50, i32 375, i32 365, i32 93, i32 207, i32 187, i32 361,
	i32 16, i32 230, i32 332, i32 122, i32 358, i32 234, i32 159, i32 44,
	i32 318, i32 180, i32 115, i32 62, i32 279, i32 165, i32 186, i32 0,
	i32 181, i32 14, i32 284, i32 320, i32 110, i32 214, i32 59, i32 338,
	i32 120, i32 364, i32 332, i32 2, i32 374, i32 301, i32 310, i32 253,
	i32 314, i32 267, i32 312, i32 188, i32 337, i32 331, i32 267, i32 6,
	i32 221, i32 354, i32 249, i32 17, i32 372, i32 351, i32 76, i32 225,
	i32 324, i32 174, i32 130, i32 330, i32 364, i32 244, i32 82, i32 191,
	i32 12, i32 33, i32 118, i32 343, i32 262, i32 251, i32 84, i32 206,
	i32 328, i32 18, i32 296, i32 182, i32 260, i32 71, i32 382, i32 94,
	i32 164, i32 255, i32 81, i32 380, i32 215, i32 220, i32 338, i32 153,
	i32 35, i32 150, i32 376, i32 0, i32 379, i32 143, i32 55, i32 112,
	i32 221, i32 293, i32 292, i32 36, i32 239, i32 380, i32 181, i32 114,
	i32 213, i32 326, i32 14, i32 207, i32 145, i32 42, i32 198, i32 211,
	i32 300, i32 97, i32 341, i32 167, i32 16, i32 285, i32 47, i32 106,
	i32 96, i32 272, i32 204, i32 127, i32 240, i32 28, i32 305, i32 356,
	i32 127, i32 43, i32 231, i32 250, i32 148, i32 8, i32 291, i32 200,
	i32 274, i32 357, i32 370, i32 328, i32 369, i32 131, i32 368, i32 41,
	i32 343, i32 32, i32 385, i32 45, i32 142, i32 268, i32 196, i32 259,
	i32 232, i32 137, i32 61, i32 131, i32 348, i32 47, i32 159, i32 302,
	i32 218, i32 259, i32 207, i32 257, i32 325, i32 364, i32 292, i32 244,
	i32 45, i32 163, i32 255, i32 353, i32 252, i32 179, i32 360, i32 199,
	i32 323, i32 176, i32 18, i32 8, i32 300, i32 180, i32 229, i32 285,
	i32 123, i32 58, i32 140, i32 175, i32 276, i32 363, i32 263, i32 316,
	i32 298, i32 149, i32 141, i32 340, i32 337, i32 125, i32 339, i32 309,
	i32 159, i32 161, i32 233, i32 210, i32 182, i32 306, i32 366, i32 26,
	i32 274, i32 243, i32 260, i32 81, i32 245, i32 176, i32 298, i32 126,
	i32 317, i32 100, i32 147, i32 315, i32 277, i32 53, i32 161, i32 166,
	i32 346, i32 130, i32 36, i32 294, i32 363, i32 186, i32 175, i32 22,
	i32 111, i32 89, i32 247, i32 49, i32 59, i32 121, i32 82, i32 126,
	i32 162, i32 316, i32 165, i32 284, i32 286, i32 248, i32 206, i32 264,
	i32 4, i32 258, i32 311, i32 359, i32 169, i32 2, i32 323, i32 269,
	i32 115, i32 384, i32 212, i32 19, i32 174, i32 243, i32 190, i32 88,
	i32 64, i32 239, i32 29, i32 185, i32 352, i32 226, i32 58, i32 242,
	i32 110, i32 260, i32 31, i32 127, i32 158, i32 370, i32 308, i32 224,
	i32 139, i32 247, i32 366, i32 152, i32 17, i32 223, i32 209, i32 74,
	i32 73, i32 15, i32 168, i32 84, i32 329, i32 338, i32 123, i32 259,
	i32 270, i32 225, i32 373, i32 266, i32 33, i32 117, i32 138, i32 121,
	i32 105, i32 350, i32 329, i32 382, i32 278, i32 307, i32 294, i32 237,
	i32 220, i32 357, i32 347, i32 53, i32 46, i32 27, i32 144, i32 190,
	i32 335, i32 146, i32 34, i32 373, i32 172, i32 188, i32 205, i32 299,
	i32 74, i32 160, i32 1, i32 271, i32 342, i32 287, i32 369, i32 362,
	i32 158, i32 12, i32 154, i32 150, i32 75, i32 102, i32 111, i32 217,
	i32 202, i32 64, i32 65, i32 297, i32 44, i32 219, i32 108, i32 327,
	i32 7, i32 345, i32 216, i32 54, i32 212, i32 63, i32 347, i32 229,
	i32 20, i32 108, i32 100, i32 61, i32 141, i32 210, i32 7, i32 179,
	i32 362, i32 169, i32 49, i32 297, i32 114, i32 140, i32 180, i32 165,
	i32 79, i32 325, i32 112, i32 270, i32 17, i32 72, i32 275, i32 88,
	i32 208, i32 86, i32 345, i32 119, i32 178, i32 290, i32 214, i32 134,
	i32 152, i32 105, i32 11, i32 89, i32 30, i32 173, i32 237, i32 375,
	i32 135, i32 367, i32 370, i32 288, i32 209, i32 39, i32 385, i32 287,
	i32 138, i32 341, i32 344, i32 25, i32 238, i32 379, i32 346, i32 72,
	i32 255, i32 289, i32 384, i32 329, i32 204, i32 66, i32 87, i32 237,
	i32 94, i32 112, i32 305, i32 30, i32 103, i32 258, i32 36, i32 187,
	i32 71, i32 319, i32 107, i32 122, i32 216, i32 86, i32 189, i32 85,
	i32 361, i32 92, i32 185, i32 320, i32 128, i32 270, i32 290, i32 191,
	i32 381, i32 284, i32 229, i32 289, i32 226, i32 279, i32 316, i32 182,
	i32 162, i32 129, i32 190, i32 201, i32 295, i32 203, i32 281, i32 184,
	i32 321, i32 10, i32 48, i32 377, i32 90, i32 240, i32 377, i32 149,
	i32 61, i32 135, i32 149, i32 60, i32 177, i32 189, i32 116, i32 136,
	i32 331, i32 83, i32 256, i32 379, i32 158, i32 292, i32 142, i32 358,
	i32 252, i32 81, i32 69, i32 322, i32 215, i32 135, i32 227, i32 311,
	i32 208, i32 326, i32 124, i32 309, i32 381, i32 53, i32 109, i32 129,
	i32 87, i32 23, i32 73, i32 128, i32 30, i32 72, i32 265, i32 360,
	i32 157, i32 23, i32 4, i32 169, i32 368, i32 122, i32 230, i32 359,
	i32 354, i32 278, i32 113, i32 171, i32 31, i32 3, i32 163, i32 293,
	i32 29, i32 19, i32 279, i32 193, i32 335, i32 326, i32 264, i32 92,
	i32 35, i32 5, i32 299, i32 314, i32 218, i32 339, i32 154, i32 288,
	i32 318, i32 205, i32 225, i32 273, i32 325, i32 301, i32 238, i32 295,
	i32 383, i32 75, i32 62, i32 276, i32 146, i32 222, i32 120, i32 133,
	i32 280, i32 291, i32 319, i32 198, i32 99, i32 38, i32 210, i32 203,
	i32 353, i32 67, i32 26, i32 74, i32 77, i32 263, i32 196, i32 24,
	i32 151, i32 37, i32 312, i32 271, i32 366, i32 335, i32 218, i32 132,
	i32 238, i32 278, i32 102, i32 315, i32 56, i32 164, i32 90, i32 60,
	i32 243, i32 131, i32 45, i32 132, i32 233, i32 144, i32 77, i32 227,
	i32 234, i32 264, i32 193, i32 153, i32 201, i32 351, i32 320, i32 82,
	i32 378, i32 200, i32 235, i32 376, i32 60, i32 95, i32 322, i32 201,
	i32 282, i32 152, i32 357, i32 117, i32 192, i32 6, i32 15, i32 73,
	i32 347, i32 145, i32 51, i32 69, i32 23, i32 157, i32 125, i32 64,
	i32 273, i32 111, i32 275, i32 262, i32 54, i32 52, i32 248, i32 106,
	i32 134, i32 253, i32 263, i32 79, i32 173, i32 235, i32 257, i32 241,
	i32 375, i32 261, i32 128, i32 63, i32 336, i32 151
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 9abff7703206541fdb83ffa80fe2c2753ad1997b"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
