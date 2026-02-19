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

@assembly_image_cache = dso_local local_unnamed_addr global [170 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [510 x i64] [
	i64 u0x0071cf2d27b7d61e, ; 0: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 85
	i64 u0x02123411c4e01926, ; 1: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 79
	i64 u0x022e81ea9c46e03a, ; 2: lib_CommunityToolkit.Maui.Core.dll.so => 36
	i64 u0x02abedc11addc1ed, ; 3: lib_Mono.Android.Runtime.dll.so => 168
	i64 u0x032267b2a94db371, ; 4: lib_Xamarin.AndroidX.AppCompat.dll.so => 63
	i64 u0x043032f1d071fae0, ; 5: ru/Microsoft.Maui.Controls.resources => 24
	i64 u0x044440a55165631e, ; 6: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 2
	i64 u0x046eb1581a80c6b0, ; 7: vi/Microsoft.Maui.Controls.resources => 30
	i64 u0x0517ef04e06e9f76, ; 8: System.Net.Primitives => 128
	i64 u0x051a3be159e4ef99, ; 9: Xamarin.GooglePlayServices.Tasks => 96
	i64 u0x0565d18c6da3de38, ; 10: Xamarin.AndroidX.RecyclerView => 82
	i64 u0x0581db89237110e9, ; 11: lib_System.Collections.dll.so => 106
	i64 u0x05989cb940b225a9, ; 12: Microsoft.Maui.dll => 55
	i64 u0x06076b5d2b581f08, ; 13: zh-HK/Microsoft.Maui.Controls.resources => 31
	i64 u0x06388ffe9f6c161a, ; 14: System.Xml.Linq.dll => 161
	i64 u0x0680a433c781bb3d, ; 15: Xamarin.AndroidX.Collection.Jvm => 66
	i64 u0x07c57877c7ba78ad, ; 16: ru/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0x07dcdc7460a0c5e4, ; 17: System.Collections.NonGeneric => 104
	i64 u0x08a7c865576bbde7, ; 18: System.Reflection.Primitives => 140
	i64 u0x08f3c9788ee2153c, ; 19: Xamarin.AndroidX.DrawerLayout => 71
	i64 u0x0919c28b89381a0b, ; 20: lib_Microsoft.Extensions.Options.dll.so => 51
	i64 u0x092266563089ae3e, ; 21: lib_System.Collections.NonGeneric.dll.so => 104
	i64 u0x098b50f911ccea8d, ; 22: lib_Xamarin.GooglePlayServices.Basement.dll.so => 95
	i64 u0x09d144a7e214d457, ; 23: System.Security.Cryptography => 152
	i64 u0x0abb3e2b271edc45, ; 24: System.Threading.Channels.dll => 157
	i64 u0x0b3b632c3bbee20c, ; 25: sk/Microsoft.Maui.Controls.resources => 25
	i64 u0x0b521223ae889727, ; 26: Xamarin.Firebase.Messaging => 89
	i64 u0x0b6aff547b84fbe9, ; 27: Xamarin.KotlinX.Serialization.Core.Jvm => 99
	i64 u0x0be2e1f8ce4064ed, ; 28: Xamarin.AndroidX.ViewPager => 87
	i64 u0x0c279376b1ae96ae, ; 29: lib_System.CodeDom.dll.so => 59
	i64 u0x0c3ca6cc978e2aae, ; 30: pt-BR/Microsoft.Maui.Controls.resources => 21
	i64 u0x0c59ad9fbbd43abe, ; 31: Mono.Android => 169
	i64 u0x0c7790f60165fc06, ; 32: lib_Microsoft.Maui.Essentials.dll.so => 56
	i64 u0x0cce4bce83380b7f, ; 33: Xamarin.AndroidX.Security.SecurityCrypto => 84
	i64 u0x0e14e73a54dda68e, ; 34: lib_System.Net.NameResolution.dll.so => 126
	i64 u0x0f5e7abaa7cf470a, ; 35: System.Net.HttpListener => 125
	i64 u0x102a31b45304b1da, ; 36: Xamarin.AndroidX.CustomView => 70
	i64 u0x10f6cfcbcf801616, ; 37: System.IO.Compression.Brotli => 117
	i64 u0x114443cdcf2091f1, ; 38: System.Security.Cryptography.Primitives => 150
	i64 u0x123639456fb056da, ; 39: System.Reflection.Emit.Lightweight.dll => 139
	i64 u0x125b7f94acb989db, ; 40: Xamarin.AndroidX.RecyclerView.dll => 82
	i64 u0x13a01de0cbc3f06c, ; 41: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 8
	i64 u0x13f1e5e209e91af4, ; 42: lib_Java.Interop.dll.so => 167
	i64 u0x13f1e880c25d96d1, ; 43: he/Microsoft.Maui.Controls.resources => 9
	i64 u0x143d8ea60a6a4011, ; 44: Microsoft.Extensions.DependencyInjection.Abstractions => 45
	i64 u0x16bf2a22df043a09, ; 45: System.IO.Pipes.dll => 120
	i64 u0x16ea2b318ad2d830, ; 46: System.Security.Cryptography.Algorithms => 149
	i64 u0x17125c9a85b4929f, ; 47: lib_netstandard.dll.so => 165
	i64 u0x17b56e25558a5d36, ; 48: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 12
	i64 u0x17f9358913beb16a, ; 49: System.Text.Encodings.Web => 154
	i64 u0x18402a709e357f3b, ; 50: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 99
	i64 u0x18f0ce884e87d89a, ; 51: nb/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x19a4c090f14ebb66, ; 52: System.Security.Claims => 148
	i64 u0x1a91866a319e9259, ; 53: lib_System.Collections.Concurrent.dll.so => 102
	i64 u0x1aac34d1917ba5d3, ; 54: lib_System.dll.so => 164
	i64 u0x1aad60783ffa3e5b, ; 55: lib-th-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x1c292b1598348d77, ; 56: Microsoft.Extensions.Diagnostics.dll => 46
	i64 u0x1c753b5ff15bce1b, ; 57: Mono.Android.Runtime.dll => 168
	i64 u0x1cb6a0ededc839e2, ; 58: lib_Google.Apis.Auth.dll.so => 40
	i64 u0x1da4110562816681, ; 59: Xamarin.AndroidX.Security.SecurityCrypto.dll => 84
	i64 u0x1e3d87657e9659bc, ; 60: Xamarin.AndroidX.Navigation.UI => 80
	i64 u0x1e71143913d56c10, ; 61: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x1ed8fcce5e9b50a0, ; 62: Microsoft.Extensions.Options.dll => 51
	i64 u0x209375905fcc1bad, ; 63: lib_System.IO.Compression.Brotli.dll.so => 117
	i64 u0x20fab3cf2dfbc8df, ; 64: lib_System.Diagnostics.Process.dll.so => 112
	i64 u0x2174319c0d835bc9, ; 65: System.Runtime => 147
	i64 u0x21cc7e445dcd5469, ; 66: System.Reflection.Emit.ILGeneration => 138
	i64 u0x220fd4f2e7c48170, ; 67: th/Microsoft.Maui.Controls.resources => 27
	i64 u0x224538d85ed15a82, ; 68: System.IO.Pipes => 120
	i64 u0x2347c268e3e4e536, ; 69: Xamarin.GooglePlayServices.Basement.dll => 95
	i64 u0x237be844f1f812c7, ; 70: System.Threading.Thread.dll => 158
	i64 u0x2407aef2bbe8fadf, ; 71: System.Console => 110
	i64 u0x240abe014b27e7d3, ; 72: Xamarin.AndroidX.Core.dll => 68
	i64 u0x247619fe4413f8bf, ; 73: System.Runtime.Serialization.Primitives.dll => 146
	i64 u0x24d4238047d7310f, ; 74: Google.Apis.Auth => 40
	i64 u0x252073cc3caa62c2, ; 75: fr/Microsoft.Maui.Controls.resources.dll => 8
	i64 u0x256b8d41255f01b1, ; 76: Xamarin.Google.Crypto.Tink.Android => 92
	i64 u0x2662c629b96b0b30, ; 77: lib_Xamarin.Kotlin.StdLib.dll.so => 97
	i64 u0x268c1439f13bcc29, ; 78: lib_Microsoft.Extensions.Primitives.dll.so => 52
	i64 u0x273f3515de5faf0d, ; 79: id/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0x2742545f9094896d, ; 80: hr/Microsoft.Maui.Controls.resources => 11
	i64 u0x27b2b16f3e9de038, ; 81: Xamarin.Google.Crypto.Tink.Android.dll => 92
	i64 u0x27b410442fad6cf1, ; 82: Java.Interop.dll => 167
	i64 u0x2801845a2c71fbfb, ; 83: System.Net.Primitives.dll => 128
	i64 u0x28e52865585a1ebe, ; 84: Microsoft.Extensions.Diagnostics.Abstractions.dll => 47
	i64 u0x2a128783efe70ba0, ; 85: uk/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x2a3b095612184159, ; 86: lib_System.Net.NetworkInformation.dll.so => 127
	i64 u0x2a6507a5ffabdf28, ; 87: System.Diagnostics.TraceSource.dll => 113
	i64 u0x2ad156c8e1354139, ; 88: fi/Microsoft.Maui.Controls.resources => 7
	i64 u0x2af298f63581d886, ; 89: System.Text.RegularExpressions.dll => 156
	i64 u0x2afc1c4f898552ee, ; 90: lib_System.Formats.Asn1.dll.so => 116
	i64 u0x2b148910ed40fbf9, ; 91: zh-Hant/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x2c8bd14bb93a7d82, ; 92: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0x2cc9e1fed6257257, ; 93: lib_System.Reflection.Emit.Lightweight.dll.so => 139
	i64 u0x2cd723e9fe623c7c, ; 94: lib_System.Private.Xml.Linq.dll.so => 136
	i64 u0x2d169d318a968379, ; 95: System.Threading.dll => 159
	i64 u0x2d47774b7d993f59, ; 96: sv/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2db915caf23548d2, ; 97: System.Text.Json.dll => 155
	i64 u0x2e6f1f226821322a, ; 98: el/Microsoft.Maui.Controls.resources.dll => 5
	i64 u0x2f02f94df3200fe5, ; 99: System.Diagnostics.Process => 112
	i64 u0x2f2e98e1c89b1aff, ; 100: System.Xml.ReaderWriter => 162
	i64 u0x2ff49de6a71764a1, ; 101: lib_Microsoft.Extensions.Http.dll.so => 48
	i64 u0x309ee9eeec09a71e, ; 102: lib_Xamarin.AndroidX.Fragment.dll.so => 72
	i64 u0x30ff0edf3d280bcd, ; 103: Firebase.Auth => 38
	i64 u0x31195fef5d8fb552, ; 104: _Microsoft.Android.Resource.Designer.dll => 34
	i64 u0x32243413e774362a, ; 105: Xamarin.AndroidX.CardView.dll => 65
	i64 u0x3235427f8d12dae1, ; 106: lib_System.Drawing.Primitives.dll.so => 114
	i64 u0x329753a17a517811, ; 107: fr/Microsoft.Maui.Controls.resources => 8
	i64 u0x32aa989ff07a84ff, ; 108: lib_System.Xml.ReaderWriter.dll.so => 162
	i64 u0x33829542f112d59b, ; 109: System.Collections.Immutable => 103
	i64 u0x33a31443733849fe, ; 110: lib-es-Microsoft.Maui.Controls.resources.dll.so => 6
	i64 u0x341abc357fbb4ebf, ; 111: lib_System.Net.Sockets.dll.so => 131
	i64 u0x34dfd74fe2afcf37, ; 112: Microsoft.Maui => 55
	i64 u0x34e292762d9615df, ; 113: cs/Microsoft.Maui.Controls.resources.dll => 2
	i64 u0x3508234247f48404, ; 114: Microsoft.Maui.Controls => 53
	i64 u0x3549870798b4cd30, ; 115: lib_Xamarin.AndroidX.ViewPager2.dll.so => 88
	i64 u0x355282fc1c909694, ; 116: Microsoft.Extensions.Configuration => 42
	i64 u0x36b2b50fdf589ae2, ; 117: System.Reflection.Emit.Lightweight => 139
	i64 u0x374ef46b06791af6, ; 118: System.Reflection.Primitives.dll => 140
	i64 u0x380134e03b1e160a, ; 119: System.Collections.Immutable.dll => 103
	i64 u0x385c17636bb6fe6e, ; 120: Xamarin.AndroidX.CustomView.dll => 70
	i64 u0x38869c811d74050e, ; 121: System.Net.NameResolution.dll => 126
	i64 u0x393c226616977fdb, ; 122: lib_Xamarin.AndroidX.ViewPager.dll.so => 87
	i64 u0x395e37c3334cf82a, ; 123: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 1
	i64 u0x39aa39fda111d9d3, ; 124: Newtonsoft.Json => 58
	i64 u0x3ab5859054645f72, ; 125: System.Security.Cryptography.Primitives.dll => 150
	i64 u0x3b860f9932505633, ; 126: lib_System.Text.Encoding.Extensions.dll.so => 153
	i64 u0x3be99b43dd39dd37, ; 127: Xamarin.AndroidX.SavedState.SavedState.Android => 83
	i64 u0x3c3aafb6b3a00bf6, ; 128: lib_System.Security.Cryptography.X509Certificates.dll.so => 151
	i64 u0x3c7c495f58ac5ee9, ; 129: Xamarin.Kotlin.StdLib => 97
	i64 u0x3d46f0b995082740, ; 130: System.Xml.Linq => 161
	i64 u0x3d9c2a242b040a50, ; 131: lib_Xamarin.AndroidX.Core.dll.so => 68
	i64 u0x407a10bb4bf95829, ; 132: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 77
	i64 u0x41cab042be111c34, ; 133: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 64
	i64 u0x42d3cd7add035099, ; 134: System.Management.dll => 61
	i64 u0x43375950ec7c1b6a, ; 135: netstandard.dll => 165
	i64 u0x434c4e1d9284cdae, ; 136: Mono.Android.dll => 169
	i64 u0x43950f84de7cc79a, ; 137: pl/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x448bd33429269b19, ; 138: Microsoft.CSharp => 101
	i64 u0x4499fa3c8e494654, ; 139: lib_System.Runtime.Serialization.Primitives.dll.so => 146
	i64 u0x4515080865a951a5, ; 140: Xamarin.Kotlin.StdLib.dll => 97
	i64 u0x45b31d67ff6f2b8a, ; 141: lib_Google.Apis.dll.so => 39
	i64 u0x45c40276a42e283e, ; 142: System.Diagnostics.TraceSource => 113
	i64 u0x46a4213bc97fe5ae, ; 143: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x47358bd471172e1d, ; 144: lib_System.Xml.Linq.dll.so => 161
	i64 u0x47daf4e1afbada10, ; 145: pt/Microsoft.Maui.Controls.resources => 22
	i64 u0x49e952f19a4e2022, ; 146: System.ObjectModel => 134
	i64 u0x49f9e6948a8131e4, ; 147: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 86
	i64 u0x4a5667b2462a664b, ; 148: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 80
	i64 u0x4b7b6532ded934b7, ; 149: System.Text.Json => 155
	i64 u0x4cc5f15266470798, ; 150: lib_Xamarin.AndroidX.Loader.dll.so => 76
	i64 u0x4cf6f67dc77aacd2, ; 151: System.Net.NetworkInformation.dll => 127
	i64 u0x4d479f968a05e504, ; 152: System.Linq.Expressions.dll => 121
	i64 u0x4d55a010ffc4faff, ; 153: System.Private.Xml => 137
	i64 u0x4d95fccc1f67c7ca, ; 154: System.Runtime.Loader.dll => 143
	i64 u0x4dcf44c3c9b076a2, ; 155: it/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x4dd9247f1d2c3235, ; 156: Xamarin.AndroidX.Loader.dll => 76
	i64 u0x4e32f00cb0937401, ; 157: Mono.Android.Runtime => 168
	i64 u0x4ebd0c4b82c5eefc, ; 158: lib_System.Threading.Channels.dll.so => 157
	i64 u0x4f21ee6ef9eb527e, ; 159: ca/Microsoft.Maui.Controls.resources => 1
	i64 u0x5037f0be3c28c7a3, ; 160: lib_Microsoft.Maui.Controls.dll.so => 53
	i64 u0x5112ed116d87baf8, ; 161: CommunityToolkit.Mvvm => 37
	i64 u0x5131bbe80989093f, ; 162: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 75
	i64 u0x51bb8a2afe774e32, ; 163: System.Drawing => 115
	i64 u0x526ce79eb8e90527, ; 164: lib_System.Net.Primitives.dll.so => 128
	i64 u0x52829f00b4467c38, ; 165: lib_System.Data.Common.dll.so => 111
	i64 u0x529ffe06f39ab8db, ; 166: Xamarin.AndroidX.Core => 68
	i64 u0x52ff996554dbf352, ; 167: Microsoft.Maui.Graphics => 57
	i64 u0x535f7e40e8fef8af, ; 168: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x53a96d5c86c9e194, ; 169: System.Net.NetworkInformation => 127
	i64 u0x53be1038a61e8d44, ; 170: System.Runtime.InteropServices.RuntimeInformation.dll => 141
	i64 u0x53c3014b9437e684, ; 171: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x5435e6f049e9bc37, ; 172: System.Security.Claims.dll => 148
	i64 u0x54795225dd1587af, ; 173: lib_System.Runtime.dll.so => 147
	i64 u0x54b42cc2b8e65a84, ; 174: Google.Apis.Core.dll => 41
	i64 u0x556e8b63b660ab8b, ; 175: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 73
	i64 u0x5588627c9a108ec9, ; 176: System.Collections.Specialized => 105
	i64 u0x571c5cfbec5ae8e2, ; 177: System.Private.Uri => 135
	i64 u0x579a06fed6eec900, ; 178: System.Private.CoreLib.dll => 166
	i64 u0x57c542c14049b66d, ; 179: System.Diagnostics.DiagnosticSource => 60
	i64 u0x58601b2dda4a27b9, ; 180: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x58688d9af496b168, ; 181: Microsoft.Extensions.DependencyInjection.dll => 44
	i64 u0x595a356d23e8da9a, ; 182: lib_Microsoft.CSharp.dll.so => 101
	i64 u0x5a89a886ae30258d, ; 183: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 67
	i64 u0x5a8f6699f4a1caa9, ; 184: lib_System.Threading.dll.so => 159
	i64 u0x5ae9cd33b15841bf, ; 185: System.ComponentModel => 109
	i64 u0x5b5f0e240a06a2a2, ; 186: da/Microsoft.Maui.Controls.resources.dll => 3
	i64 u0x5b755276902c8414, ; 187: Xamarin.GooglePlayServices.Base => 94
	i64 u0x5c393624b8176517, ; 188: lib_Microsoft.Extensions.Logging.dll.so => 49
	i64 u0x5d0a4a29b02d9d3c, ; 189: System.Net.WebHeaderCollection.dll => 132
	i64 u0x5db0cbbd1028510e, ; 190: lib_System.Runtime.InteropServices.dll.so => 142
	i64 u0x5db30905d3e5013b, ; 191: Xamarin.AndroidX.Collection.Jvm.dll => 66
	i64 u0x5e467bc8f09ad026, ; 192: System.Collections.Specialized.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 193: System.Text.Encodings.Web.dll => 154
	i64 u0x5eb8046dd40e9ac3, ; 194: System.ComponentModel.Primitives => 107
	i64 u0x5eee1376d94c7f5e, ; 195: System.Net.HttpListener.dll => 125
	i64 u0x5f36ccf5c6a57e24, ; 196: System.Xml.ReaderWriter.dll => 162
	i64 u0x5f4294b9b63cb842, ; 197: System.Data.Common => 111
	i64 u0x5f4fa8b9ffd0e2c5, ; 198: lib_Xamarin.Google.Android.DataTransport.TransportApi.dll.so => 90
	i64 u0x5f9a2d823f664957, ; 199: lib-el-Microsoft.Maui.Controls.resources.dll.so => 5
	i64 u0x609f4b7b63d802d4, ; 200: lib_Microsoft.Extensions.DependencyInjection.dll.so => 44
	i64 u0x60cd4e33d7e60134, ; 201: Xamarin.KotlinX.Coroutines.Core.Jvm => 98
	i64 u0x60f62d786afcf130, ; 202: System.Memory => 123
	i64 u0x61be8d1299194243, ; 203: Microsoft.Maui.Controls.Xaml => 54
	i64 u0x61d2cba29557038f, ; 204: de/Microsoft.Maui.Controls.resources => 4
	i64 u0x61d88f399afb2f45, ; 205: lib_System.Runtime.Loader.dll.so => 143
	i64 u0x622eef6f9e59068d, ; 206: System.Private.CoreLib => 166
	i64 u0x63f1f6883c1e23c2, ; 207: lib_System.Collections.Immutable.dll.so => 103
	i64 u0x6400f68068c1e9f1, ; 208: Xamarin.Google.Android.Material.dll => 91
	i64 u0x640e3b14dbd325c2, ; 209: System.Security.Cryptography.Algorithms.dll => 149
	i64 u0x658f524e4aba7dad, ; 210: CommunityToolkit.Maui.dll => 35
	i64 u0x65ecac39144dd3cc, ; 211: Microsoft.Maui.Controls.dll => 53
	i64 u0x65ece51227bfa724, ; 212: lib_System.Runtime.Numerics.dll.so => 144
	i64 u0x6692e924eade1b29, ; 213: lib_System.Console.dll.so => 110
	i64 u0x66a4e5c6a3fb0bae, ; 214: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 75
	i64 u0x66d13304ce1a3efa, ; 215: Xamarin.AndroidX.CursorAdapter => 69
	i64 u0x68558ec653afa616, ; 216: lib-da-Microsoft.Maui.Controls.resources.dll.so => 3
	i64 u0x6872ec7a2e36b1ac, ; 217: System.Drawing.Primitives.dll => 114
	i64 u0x68fbbbe2eb455198, ; 218: System.Formats.Asn1 => 116
	i64 u0x69063fc0ba8e6bdd, ; 219: he/Microsoft.Maui.Controls.resources.dll => 9
	i64 u0x6a4d7577b2317255, ; 220: System.Runtime.InteropServices.dll => 142
	i64 u0x6ace3b74b15ee4a4, ; 221: nb/Microsoft.Maui.Controls.resources => 18
	i64 u0x6bc822f45373a1d6, ; 222: Google.Apis.dll => 39
	i64 u0x6ccc0c6e8d8aabeb, ; 223: VendCaseStudy.dll => 100
	i64 u0x6d12bfaa99c72b1f, ; 224: lib_Microsoft.Maui.Graphics.dll.so => 57
	i64 u0x6d79993361e10ef2, ; 225: Microsoft.Extensions.Primitives => 52
	i64 u0x6d86d56b84c8eb71, ; 226: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 69
	i64 u0x6d9bea6b3e895cf7, ; 227: Microsoft.Extensions.Primitives.dll => 52
	i64 u0x6e25a02c3833319a, ; 228: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 78
	i64 u0x6fd2265da78b93a4, ; 229: lib_Microsoft.Maui.dll.so => 55
	i64 u0x6fdfc7de82c33008, ; 230: cs/Microsoft.Maui.Controls.resources => 2
	i64 u0x70e99f48c05cb921, ; 231: tr/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0x70fd3deda22442d2, ; 232: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x717530326f808838, ; 233: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 47
	i64 u0x71a495ea3761dde8, ; 234: lib-it-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x71ad672adbe48f35, ; 235: System.ComponentModel.Primitives.dll => 107
	i64 u0x72b1fb4109e08d7b, ; 236: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 11
	i64 u0x73e4ce94e2eb6ffc, ; 237: lib_System.Memory.dll.so => 123
	i64 u0x74327ad47b9741a4, ; 238: Xamarin.AndroidX.NavigationEvent.Android.dll => 81
	i64 u0x746cf89b511b4d40, ; 239: lib_Microsoft.Extensions.Diagnostics.dll.so => 46
	i64 u0x751ef193ea61c915, ; 240: lib_VendCaseStudy.dll.so => 100
	i64 u0x755a91767330b3d4, ; 241: lib_Microsoft.Extensions.Configuration.dll.so => 42
	i64 u0x7695e24336464e91, ; 242: Xamarin.GooglePlayServices.Auth => 93
	i64 u0x76ca07b878f44da0, ; 243: System.Runtime.Numerics.dll => 144
	i64 u0x780bc73597a503a9, ; 244: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x783606d1e53e7a1a, ; 245: th/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x78a45e51311409b6, ; 246: Xamarin.AndroidX.Fragment.dll => 72
	i64 u0x793546dbadd324b1, ; 247: Xamarin.Google.Android.DataTransport.TransportApi => 90
	i64 u0x7a25bdb29108c6e7, ; 248: Microsoft.Extensions.Http => 48
	i64 u0x7adb8da2ac89b647, ; 249: fi/Microsoft.Maui.Controls.resources.dll => 7
	i64 u0x7bef86a4335c4870, ; 250: System.ComponentModel.TypeConverter => 108
	i64 u0x7c0820144cd34d6a, ; 251: sk/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0x7c2a0bd1e0f988fc, ; 252: lib-de-Microsoft.Maui.Controls.resources.dll.so => 4
	i64 u0x7cb95ad2a929d044, ; 253: Xamarin.GooglePlayServices.Basement => 95
	i64 u0x7cc637f941f716d0, ; 254: CommunityToolkit.Maui.Core => 36
	i64 u0x7d649b75d580bb42, ; 255: ms/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0x7d8ee2bdc8e3aad1, ; 256: System.Numerics.Vectors => 133
	i64 u0x7dfc3d6d9d8d7b70, ; 257: System.Collections => 106
	i64 u0x7e302e110e1e1346, ; 258: lib_System.Security.Claims.dll.so => 148
	i64 u0x7e946809d6008ef2, ; 259: lib_System.ObjectModel.dll.so => 134
	i64 u0x7eb4f0dc47488736, ; 260: lib_Xamarin.GooglePlayServices.Tasks.dll.so => 96
	i64 u0x7ecc13347c8fd849, ; 261: lib_System.ComponentModel.dll.so => 109
	i64 u0x7f00ddd9b9ca5a13, ; 262: Xamarin.AndroidX.ViewPager.dll => 87
	i64 u0x7f9351cd44b1273f, ; 263: Microsoft.Extensions.Configuration.Abstractions => 43
	i64 u0x7fbd557c99b3ce6f, ; 264: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 74
	i64 u0x812c069d5cdecc17, ; 265: System.dll => 164
	i64 u0x81ab745f6c0f5ce6, ; 266: zh-Hant/Microsoft.Maui.Controls.resources => 33
	i64 u0x8277f2be6b5ce05f, ; 267: Xamarin.AndroidX.AppCompat => 63
	i64 u0x828f06563b30bc50, ; 268: lib_Xamarin.AndroidX.CardView.dll.so => 65
	i64 u0x82df8f5532a10c59, ; 269: lib_System.Drawing.dll.so => 115
	i64 u0x82f6403342e12049, ; 270: uk/Microsoft.Maui.Controls.resources => 29
	i64 u0x835690121a483668, ; 271: VendCaseStudy => 100
	i64 u0x83c14ba66c8e2b8c, ; 272: zh-Hans/Microsoft.Maui.Controls.resources => 32
	i64 u0x84ae73148a4557d2, ; 273: lib_System.IO.Pipes.dll.so => 120
	i64 u0x86a909228dc7657b, ; 274: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x86b3e00c36b84509, ; 275: Microsoft.Extensions.Configuration.dll => 42
	i64 u0x87c69b87d9283884, ; 276: lib_System.Threading.Thread.dll.so => 158
	i64 u0x87f6569b25707834, ; 277: System.IO.Compression.Brotli.dll => 117
	i64 u0x8842b3a5d2d3fb36, ; 278: Microsoft.Maui.Essentials => 56
	i64 u0x88bda98e0cffb7a9, ; 279: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 98
	i64 u0x8930322c7bd8f768, ; 280: netstandard => 165
	i64 u0x897a606c9e39c75f, ; 281: lib_System.ComponentModel.Primitives.dll.so => 107
	i64 u0x898a5c6bc9e47ec1, ; 282: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 83
	i64 u0x89c5188089ec2cd5, ; 283: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 141
	i64 u0x8ad229ea26432ee2, ; 284: Xamarin.AndroidX.Loader => 76
	i64 u0x8b4ff5d0fdd5faa1, ; 285: lib_System.Diagnostics.DiagnosticSource.dll.so => 60
	i64 u0x8b8d01333a96d0b5, ; 286: System.Diagnostics.Process.dll => 112
	i64 u0x8b9ceca7acae3451, ; 287: lib-he-Microsoft.Maui.Controls.resources.dll.so => 9
	i64 u0x8d0f420977c2c1c7, ; 288: Xamarin.AndroidX.CursorAdapter.dll => 69
	i64 u0x8d7b8ab4b3310ead, ; 289: System.Threading => 159
	i64 u0x8da188285aadfe8e, ; 290: System.Collections.Concurrent => 102
	i64 u0x8ec6e06a61c1baeb, ; 291: lib_Newtonsoft.Json.dll.so => 58
	i64 u0x8ed807bfe9858dfc, ; 292: Xamarin.AndroidX.Navigation.Common => 77
	i64 u0x8ee08b8194a30f48, ; 293: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 10
	i64 u0x8ef7601039857a44, ; 294: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8efbc0801a122264, ; 295: Xamarin.GooglePlayServices.Tasks.dll => 96
	i64 u0x8f32c6f611f6ffab, ; 296: pt/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x8f8829d21c8985a4, ; 297: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x90263f8448b8f572, ; 298: lib_System.Diagnostics.TraceSource.dll.so => 113
	i64 u0x903101b46fb73a04, ; 299: _Microsoft.Android.Resource.Designer => 34
	i64 u0x90393bd4865292f3, ; 300: lib_System.IO.Compression.dll.so => 118
	i64 u0x90634f86c5ebe2b5, ; 301: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 75
	i64 u0x907b636704ad79ef, ; 302: lib_Microsoft.Maui.Controls.Xaml.dll.so => 54
	i64 u0x91418dc638b29e68, ; 303: lib_Xamarin.AndroidX.CustomView.dll.so => 70
	i64 u0x9157bd523cd7ed36, ; 304: lib_System.Text.Json.dll.so => 155
	i64 u0x91a74f07b30d37e2, ; 305: System.Linq.dll => 122
	i64 u0x91fa41a87223399f, ; 306: ca/Microsoft.Maui.Controls.resources.dll => 1
	i64 u0x93cfa73ab28d6e35, ; 307: ms/Microsoft.Maui.Controls.resources => 17
	i64 u0x944077d8ca3c6580, ; 308: System.IO.Compression.dll => 118
	i64 u0x967fc325e09bfa8c, ; 309: es/Microsoft.Maui.Controls.resources => 6
	i64 u0x9729c8c4c069c478, ; 310: Google.Apis.Core => 41
	i64 u0x9732d8dbddea3d9a, ; 311: id/Microsoft.Maui.Controls.resources => 13
	i64 u0x978be80e5210d31b, ; 312: Microsoft.Maui.Graphics.dll => 57
	i64 u0x979ab54025cc1c7f, ; 313: lib_Xamarin.GooglePlayServices.Base.dll.so => 94
	i64 u0x97a7d96b96967bc2, ; 314: lib_Firebase.Auth.dll.so => 38
	i64 u0x97b8c771ea3e4220, ; 315: System.ComponentModel.dll => 109
	i64 u0x97e144c9d3c6976e, ; 316: System.Collections.Concurrent.dll => 102
	i64 u0x98b05cc81e6f333c, ; 317: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 83
	i64 u0x991d510397f92d9d, ; 318: System.Linq.Expressions => 121
	i64 u0x999cb19e1a04ffd3, ; 319: CommunityToolkit.Mvvm.dll => 37
	i64 u0x99a00ca5270c6878, ; 320: Xamarin.AndroidX.Navigation.Runtime => 79
	i64 u0x99cdc6d1f2d3a72f, ; 321: ko/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x9c244ac7cda32d26, ; 322: System.Security.Cryptography.X509Certificates.dll => 151
	i64 u0x9d5dbcf5a48583fe, ; 323: lib_Xamarin.AndroidX.Activity.dll.so => 62
	i64 u0x9d74dee1a7725f34, ; 324: Microsoft.Extensions.Configuration.Abstractions.dll => 43
	i64 u0x9e4534b6adaf6e84, ; 325: nl/Microsoft.Maui.Controls.resources => 19
	i64 u0x9eaf1efdf6f7267e, ; 326: Xamarin.AndroidX.Navigation.Common.dll => 77
	i64 u0x9ef542cf1f78c506, ; 327: Xamarin.AndroidX.Lifecycle.LiveData.Core => 74
	i64 u0xa088c6d6689b264d, ; 328: Firebase.Auth.dll => 38
	i64 u0xa0d8259f4cc284ec, ; 329: lib_System.Security.Cryptography.dll.so => 152
	i64 u0xa0e17ca50c77a225, ; 330: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 92
	i64 u0xa1440773ee9d341e, ; 331: Xamarin.Google.Android.Material => 91
	i64 u0xa1b9d7c27f47219f, ; 332: Xamarin.AndroidX.Navigation.UI.dll => 80
	i64 u0xa2572680829d2c7c, ; 333: System.IO.Pipelines.dll => 119
	i64 u0xa46aa1eaa214539b, ; 334: ko/Microsoft.Maui.Controls.resources => 16
	i64 u0xa4a372eecb9e4df0, ; 335: Microsoft.Extensions.Diagnostics => 46
	i64 u0xa4d20d2ff0563d26, ; 336: lib_CommunityToolkit.Mvvm.dll.so => 37
	i64 u0xa4edc8f2ceae241a, ; 337: System.Data.Common.dll => 111
	i64 u0xa5494f40f128ce6a, ; 338: System.Runtime.Serialization.Formatters.dll => 145
	i64 u0xa5e599d1e0524750, ; 339: System.Numerics.Vectors.dll => 133
	i64 u0xa5f1ba49b85dd355, ; 340: System.Security.Cryptography.dll => 152
	i64 u0xa684b098dd27b296, ; 341: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 84
	i64 u0xa68a420042bb9b1f, ; 342: Xamarin.AndroidX.DrawerLayout.dll => 71
	i64 u0xa78ce3745383236a, ; 343: Xamarin.AndroidX.Lifecycle.Common.Jvm => 73
	i64 u0xa7a08e0f3bd00c3e, ; 344: Xamarin.Firebase.Messaging.dll => 89
	i64 u0xa7c31b56b4dc7b33, ; 345: hu/Microsoft.Maui.Controls.resources => 12
	i64 u0xa843f6095f0d247d, ; 346: Xamarin.GooglePlayServices.Base.dll => 94
	i64 u0xa964304b5631e28a, ; 347: CommunityToolkit.Maui.Core.dll => 36
	i64 u0xaa2219c8e3449ff5, ; 348: Microsoft.Extensions.Logging.Abstractions => 50
	i64 u0xaa443ac34067eeef, ; 349: System.Private.Xml.dll => 137
	i64 u0xaa52de307ef5d1dd, ; 350: System.Net.Http => 124
	i64 u0xaaaf86367285a918, ; 351: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 45
	i64 u0xaaf84bb3f052a265, ; 352: el/Microsoft.Maui.Controls.resources => 5
	i64 u0xab9c1b2687d86b0b, ; 353: lib_System.Linq.Expressions.dll.so => 121
	i64 u0xac2af3fa195a15ce, ; 354: System.Runtime.Numerics => 144
	i64 u0xac5376a2a538dc10, ; 355: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 74
	i64 u0xac98d31068e24591, ; 356: System.Xml.XDocument => 163
	i64 u0xacd46e002c3ccb97, ; 357: ro/Microsoft.Maui.Controls.resources => 23
	i64 u0xacf42eea7ef9cd12, ; 358: System.Threading.Channels => 157
	i64 u0xad89c07347f1bad6, ; 359: nl/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xadbb53caf78a79d2, ; 360: System.Web.HttpUtility => 160
	i64 u0xadc90ab061a9e6e4, ; 361: System.ComponentModel.TypeConverter.dll => 108
	i64 u0xadf511667bef3595, ; 362: System.Net.Security => 130
	i64 u0xae282bcd03739de7, ; 363: Java.Interop => 167
	i64 u0xae53579c90db1107, ; 364: System.ObjectModel.dll => 134
	i64 u0xb05cc42cd94c6d9d, ; 365: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xb220631954820169, ; 366: System.Text.RegularExpressions => 156
	i64 u0xb2a3f67f3bf29fce, ; 367: da/Microsoft.Maui.Controls.resources => 3
	i64 u0xb3f0a0fcda8d3ebc, ; 368: Xamarin.AndroidX.CardView => 65
	i64 u0xb46be1aa6d4fff93, ; 369: hi/Microsoft.Maui.Controls.resources => 10
	i64 u0xb477491be13109d8, ; 370: ar/Microsoft.Maui.Controls.resources => 0
	i64 u0xb4bd7015ecee9d86, ; 371: System.IO.Pipelines => 119
	i64 u0xb5c7fcdafbc67ee4, ; 372: Microsoft.Extensions.Logging.Abstractions.dll => 50
	i64 u0xb7212c4683a94afe, ; 373: System.Drawing.Primitives => 114
	i64 u0xb7b7753d1f319409, ; 374: sv/Microsoft.Maui.Controls.resources => 26
	i64 u0xb81a2c6e0aee50fe, ; 375: lib_System.Private.CoreLib.dll.so => 166
	i64 u0xb872c26142d22aa9, ; 376: Microsoft.Extensions.Http.dll => 48
	i64 u0xb898d1802c1a108c, ; 377: lib_System.Management.dll.so => 61
	i64 u0xb9185c33a1643eed, ; 378: Microsoft.CSharp.dll => 101
	i64 u0xb9f64d3b230def68, ; 379: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0xb9fc3c8a556e3691, ; 380: ja/Microsoft.Maui.Controls.resources => 15
	i64 u0xba4670aa94a2b3c6, ; 381: lib_System.Xml.XDocument.dll.so => 163
	i64 u0xba48785529705af9, ; 382: System.Collections.dll => 106
	i64 u0xbb65706fde942ce3, ; 383: System.Net.Sockets => 131
	i64 u0xbbd180354b67271a, ; 384: System.Runtime.Serialization.Formatters => 145
	i64 u0xbd0e2c0d55246576, ; 385: System.Net.Http.dll => 124
	i64 u0xbd3fbd85b9e1cb29, ; 386: lib_System.Net.HttpListener.dll.so => 125
	i64 u0xbd437a2cdb333d0d, ; 387: Xamarin.AndroidX.ViewPager2 => 88
	i64 u0xbee38d4a88835966, ; 388: Xamarin.AndroidX.AppCompat.AppCompatResources => 64
	i64 u0xc040a4ab55817f58, ; 389: ar/Microsoft.Maui.Controls.resources.dll => 0
	i64 u0xc0d928351ab5ca77, ; 390: System.Console.dll => 110
	i64 u0xc12b8b3afa48329c, ; 391: lib_System.Linq.dll.so => 122
	i64 u0xc1ff9ae3cdb6e1e6, ; 392: Xamarin.AndroidX.Activity.dll => 62
	i64 u0xc2850fbba221599d, ; 393: lib_Google.Apis.Core.dll.so => 41
	i64 u0xc28c50f32f81cc73, ; 394: ja/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0xc2bcfec99f69365e, ; 395: Xamarin.AndroidX.ViewPager2.dll => 88
	i64 u0xc50fded0ded1418c, ; 396: lib_System.ComponentModel.TypeConverter.dll.so => 108
	i64 u0xc519125d6bc8fb11, ; 397: lib_System.Net.Requests.dll.so => 129
	i64 u0xc5293b19e4dc230e, ; 398: Xamarin.AndroidX.Navigation.Fragment => 78
	i64 u0xc5325b2fcb37446f, ; 399: lib_System.Private.Xml.dll.so => 137
	i64 u0xc5a0f4b95a699af7, ; 400: lib_System.Private.Uri.dll.so => 135
	i64 u0xc5cdcd5b6277579e, ; 401: lib_System.Security.Cryptography.Algorithms.dll.so => 149
	i64 u0xc5d608afb58abba2, ; 402: Google.Apis.Auth.dll => 40
	i64 u0xc7c01e7d7c93a110, ; 403: System.Text.Encoding.Extensions.dll => 153
	i64 u0xc7ce851898a4548e, ; 404: lib_System.Web.HttpUtility.dll.so => 160
	i64 u0xc858a28d9ee5a6c5, ; 405: lib_System.Collections.Specialized.dll.so => 105
	i64 u0xc9e54b32fc19baf3, ; 406: lib_CommunityToolkit.Maui.dll.so => 35
	i64 u0xca3a723e7342c5b6, ; 407: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0xcab3493c70141c2d, ; 408: pl/Microsoft.Maui.Controls.resources => 20
	i64 u0xcacfddc9f7c6de76, ; 409: ro/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xcbd4fdd9cef4a294, ; 410: lib__Microsoft.Android.Resource.Designer.dll.so => 34
	i64 u0xcc2876b32ef2794c, ; 411: lib_System.Text.RegularExpressions.dll.so => 156
	i64 u0xcc5c3bb714c4561e, ; 412: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 98
	i64 u0xcc76886e09b88260, ; 413: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 99
	i64 u0xccf25c4b634ccd3a, ; 414: zh-Hans/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xcd10a42808629144, ; 415: System.Net.Requests => 129
	i64 u0xcdd0c48b6937b21c, ; 416: Xamarin.AndroidX.SwipeRefreshLayout => 85
	i64 u0xcf23d8093f3ceadf, ; 417: System.Diagnostics.DiagnosticSource.dll => 60
	i64 u0xcf8fc898f98b0d34, ; 418: System.Private.Xml.Linq => 136
	i64 u0xd1194e1d8a8de83c, ; 419: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 73
	i64 u0xd16fd7fb9bbcd43e, ; 420: Microsoft.Extensions.Diagnostics.Abstractions => 47
	i64 u0xd333d0af9e423810, ; 421: System.Runtime.InteropServices => 142
	i64 u0xd3426d966bb704f5, ; 422: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 64
	i64 u0xd3651b6fc3125825, ; 423: System.Private.Uri.dll => 135
	i64 u0xd373685349b1fe8b, ; 424: Microsoft.Extensions.Logging.dll => 49
	i64 u0xd3e4c8d6a2d5d470, ; 425: it/Microsoft.Maui.Controls.resources => 14
	i64 u0xd4645626dffec99d, ; 426: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 45
	i64 u0xd4755510f93c31a7, ; 427: Xamarin.GooglePlayServices.Auth.dll => 93
	i64 u0xd6d21782156bc35b, ; 428: Xamarin.AndroidX.SwipeRefreshLayout.dll => 85
	i64 u0xd6f6d366d4896aef, ; 429: lib_Xamarin.AndroidX.NavigationEvent.Android.dll.so => 81
	i64 u0xd72329819cbbbc44, ; 430: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 43
	i64 u0xd7b3764ada9d341d, ; 431: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 50
	i64 u0xd7f0088bc5ad71f2, ; 432: Xamarin.AndroidX.VersionedParcelable => 86
	i64 u0xd8113d9a7e8ad136, ; 433: System.CodeDom => 59
	i64 u0xda1dfa4c534a9251, ; 434: Microsoft.Extensions.DependencyInjection => 44
	i64 u0xdad05a11827959a3, ; 435: System.Collections.NonGeneric.dll => 104
	i64 u0xdb5383ab5865c007, ; 436: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0xdb58816721c02a59, ; 437: lib_System.Reflection.Emit.ILGeneration.dll.so => 138
	i64 u0xdbeda89f832aa805, ; 438: vi/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0xdbf9607a441b4505, ; 439: System.Linq => 122
	i64 u0xdcbd21904ff0f297, ; 440: Google.Apis => 39
	i64 u0xdce2c53525640bf3, ; 441: Microsoft.Extensions.Logging => 49
	i64 u0xdd2b722d78ef5f43, ; 442: System.Runtime.dll => 147
	i64 u0xdd67031857c72f96, ; 443: lib_System.Text.Encodings.Web.dll.so => 154
	i64 u0xdde30e6b77aa6f6c, ; 444: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xde110ae80fa7c2e2, ; 445: System.Xml.XDocument.dll => 163
	i64 u0xde8769ebda7d8647, ; 446: hr/Microsoft.Maui.Controls.resources.dll => 11
	i64 u0xe0142572c095a480, ; 447: Xamarin.AndroidX.AppCompat.dll => 63
	i64 u0xe02f89350ec78051, ; 448: Xamarin.AndroidX.CoordinatorLayout.dll => 67
	i64 u0xe03ac59b394077a7, ; 449: lib_Xamarin.Firebase.Messaging.dll.so => 89
	i64 u0xe10b760bb1462e7a, ; 450: lib_System.Security.Cryptography.Primitives.dll.so => 150
	i64 u0xe192a588d4410686, ; 451: lib_System.IO.Pipelines.dll.so => 119
	i64 u0xe1a08bd3fa539e0d, ; 452: System.Runtime.Loader => 143
	i64 u0xe1b52f9f816c70ef, ; 453: System.Private.Xml.Linq.dll => 136
	i64 u0xe1ecfdb7fff86067, ; 454: System.Net.Security.dll => 130
	i64 u0xe2420585aeceb728, ; 455: System.Net.Requests.dll => 129
	i64 u0xe29b73bc11392966, ; 456: lib-id-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xe3811d68d4fe8463, ; 457: pt-BR/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0xe494f7ced4ecd10a, ; 458: hu/Microsoft.Maui.Controls.resources.dll => 12
	i64 u0xe4a9b1e40d1e8917, ; 459: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 7
	i64 u0xe4f74a0b5bf9703f, ; 460: System.Runtime.Serialization.Primitives => 146
	i64 u0xe5434e8a119ceb69, ; 461: lib_Mono.Android.dll.so => 169
	i64 u0xe7ef84b36819564e, ; 462: Xamarin.AndroidX.NavigationEvent.Android => 81
	i64 u0xe89a2a9ef110899b, ; 463: System.Drawing.dll => 115
	i64 u0xeaf8e9970fc2fe69, ; 464: System.Management => 61
	i64 u0xed19c616b3fcb7eb, ; 465: Xamarin.AndroidX.VersionedParcelable.dll => 86
	i64 u0xedc4817167106c23, ; 466: System.Net.Sockets.dll => 131
	i64 u0xedc632067fb20ff3, ; 467: System.Memory.dll => 123
	i64 u0xedc8e4ca71a02a8b, ; 468: Xamarin.AndroidX.Navigation.Runtime.dll => 79
	i64 u0xeeb7ebb80150501b, ; 469: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 66
	i64 u0xef72742e1bcca27a, ; 470: Microsoft.Maui.Essentials.dll => 56
	i64 u0xefec0b7fdc57ec42, ; 471: Xamarin.AndroidX.Activity => 62
	i64 u0xf008bcd238ede2c8, ; 472: System.CodeDom.dll => 59
	i64 u0xf00c29406ea45e19, ; 473: es/Microsoft.Maui.Controls.resources.dll => 6
	i64 u0xf09e47b6ae914f6e, ; 474: System.Net.NameResolution => 126
	i64 u0xf0de2537ee19c6ca, ; 475: lib_System.Net.WebHeaderCollection.dll.so => 132
	i64 u0xf11b621fc87b983f, ; 476: Microsoft.Maui.Controls.Xaml.dll => 54
	i64 u0xf1c4b4005493d871, ; 477: System.Formats.Asn1.dll => 116
	i64 u0xf2039b1a33e63e8e, ; 478: Xamarin.Google.Android.DataTransport.TransportApi.dll => 90
	i64 u0xf238bd79489d3a96, ; 479: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0xf37221fda4ef8830, ; 480: lib_Xamarin.Google.Android.Material.dll.so => 91
	i64 u0xf3ddfe05336abf29, ; 481: System => 164
	i64 u0xf408654b2a135055, ; 482: System.Reflection.Emit.ILGeneration.dll => 138
	i64 u0xf4c1dd70a5496a17, ; 483: System.IO.Compression => 118
	i64 u0xf5fc7602fe27b333, ; 484: System.Net.WebHeaderCollection => 132
	i64 u0xf6077741019d7428, ; 485: Xamarin.AndroidX.CoordinatorLayout => 67
	i64 u0xf77b20923f07c667, ; 486: de/Microsoft.Maui.Controls.resources.dll => 4
	i64 u0xf7c38c072af2fe21, ; 487: lib_Xamarin.GooglePlayServices.Auth.dll.so => 93
	i64 u0xf7e2cac4c45067b3, ; 488: lib_System.Numerics.Vectors.dll.so => 133
	i64 u0xf7e74930e0e3d214, ; 489: zh-HK/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0xf7fa0bf77fe677cc, ; 490: Newtonsoft.Json.dll => 58
	i64 u0xf84773b5c81e3cef, ; 491: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0xf8b77539b362d3ba, ; 492: lib_System.Reflection.Primitives.dll.so => 140
	i64 u0xf8e045dc345b2ea3, ; 493: lib_Xamarin.AndroidX.RecyclerView.dll.so => 82
	i64 u0xf915dc29808193a1, ; 494: System.Web.HttpUtility.dll => 160
	i64 u0xf96c777a2a0686f4, ; 495: hi/Microsoft.Maui.Controls.resources.dll => 10
	i64 u0xf9eec5bb3a6aedc6, ; 496: Microsoft.Extensions.Options => 51
	i64 u0xfa3f278f288b0e84, ; 497: lib_System.Net.Security.dll.so => 130
	i64 u0xfa5ed7226d978949, ; 498: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 0
	i64 u0xfa645d91e9fc4cba, ; 499: System.Threading.Thread => 158
	i64 u0xfbad3e4ce4b98145, ; 500: System.Security.Cryptography.X509Certificates => 151
	i64 u0xfbf0a31c9fc34bc4, ; 501: lib_System.Net.Http.dll.so => 124
	i64 u0xfc6b7527cc280b3f, ; 502: lib_System.Runtime.Serialization.Formatters.dll.so => 145
	i64 u0xfc719aec26adf9d9, ; 503: Xamarin.AndroidX.Navigation.Fragment.dll => 78
	i64 u0xfd22f00870e40ae0, ; 504: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 71
	i64 u0xfd49b3c1a76e2748, ; 505: System.Runtime.InteropServices.RuntimeInformation => 141
	i64 u0xfd536c702f64dc47, ; 506: System.Text.Encoding.Extensions => 153
	i64 u0xfd583f7657b6a1cb, ; 507: Xamarin.AndroidX.Fragment => 72
	i64 u0xfdbe4710aa9beeff, ; 508: CommunityToolkit.Maui => 35
	i64 u0xfeae9952cf03b8cb ; 509: tr/Microsoft.Maui.Controls.resources => 28
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [510 x i32] [
	i32 85, i32 79, i32 36, i32 168, i32 63, i32 24, i32 2, i32 30,
	i32 128, i32 96, i32 82, i32 106, i32 55, i32 31, i32 161, i32 66,
	i32 24, i32 104, i32 140, i32 71, i32 51, i32 104, i32 95, i32 152,
	i32 157, i32 25, i32 89, i32 99, i32 87, i32 59, i32 21, i32 169,
	i32 56, i32 84, i32 126, i32 125, i32 70, i32 117, i32 150, i32 139,
	i32 82, i32 8, i32 167, i32 9, i32 45, i32 120, i32 149, i32 165,
	i32 12, i32 154, i32 99, i32 18, i32 148, i32 102, i32 164, i32 27,
	i32 46, i32 168, i32 40, i32 84, i32 80, i32 16, i32 51, i32 117,
	i32 112, i32 147, i32 138, i32 27, i32 120, i32 95, i32 158, i32 110,
	i32 68, i32 146, i32 40, i32 8, i32 92, i32 97, i32 52, i32 13,
	i32 11, i32 92, i32 167, i32 128, i32 47, i32 29, i32 127, i32 113,
	i32 7, i32 156, i32 116, i32 33, i32 20, i32 139, i32 136, i32 159,
	i32 26, i32 155, i32 5, i32 112, i32 162, i32 48, i32 72, i32 38,
	i32 34, i32 65, i32 114, i32 8, i32 162, i32 103, i32 6, i32 131,
	i32 55, i32 2, i32 53, i32 88, i32 42, i32 139, i32 140, i32 103,
	i32 70, i32 126, i32 87, i32 1, i32 58, i32 150, i32 153, i32 83,
	i32 151, i32 97, i32 161, i32 68, i32 77, i32 64, i32 61, i32 165,
	i32 169, i32 20, i32 101, i32 146, i32 97, i32 39, i32 113, i32 24,
	i32 161, i32 22, i32 134, i32 86, i32 80, i32 155, i32 76, i32 127,
	i32 121, i32 137, i32 143, i32 14, i32 76, i32 168, i32 157, i32 1,
	i32 53, i32 37, i32 75, i32 115, i32 128, i32 111, i32 68, i32 57,
	i32 25, i32 127, i32 141, i32 31, i32 148, i32 147, i32 41, i32 73,
	i32 105, i32 135, i32 166, i32 60, i32 15, i32 44, i32 101, i32 67,
	i32 159, i32 109, i32 3, i32 94, i32 49, i32 132, i32 142, i32 66,
	i32 105, i32 154, i32 107, i32 125, i32 162, i32 111, i32 90, i32 5,
	i32 44, i32 98, i32 123, i32 54, i32 4, i32 143, i32 166, i32 103,
	i32 91, i32 149, i32 35, i32 53, i32 144, i32 110, i32 75, i32 69,
	i32 3, i32 114, i32 116, i32 9, i32 142, i32 18, i32 39, i32 100,
	i32 57, i32 52, i32 69, i32 52, i32 78, i32 55, i32 2, i32 28,
	i32 18, i32 47, i32 14, i32 107, i32 11, i32 123, i32 81, i32 46,
	i32 100, i32 42, i32 93, i32 144, i32 17, i32 27, i32 72, i32 90,
	i32 48, i32 7, i32 108, i32 25, i32 4, i32 95, i32 36, i32 17,
	i32 133, i32 106, i32 148, i32 134, i32 96, i32 109, i32 87, i32 43,
	i32 74, i32 164, i32 33, i32 63, i32 65, i32 115, i32 29, i32 100,
	i32 32, i32 120, i32 33, i32 42, i32 158, i32 117, i32 56, i32 98,
	i32 165, i32 107, i32 83, i32 141, i32 76, i32 60, i32 112, i32 9,
	i32 69, i32 159, i32 102, i32 58, i32 77, i32 10, i32 23, i32 96,
	i32 22, i32 21, i32 113, i32 34, i32 118, i32 75, i32 54, i32 70,
	i32 155, i32 122, i32 1, i32 17, i32 118, i32 6, i32 41, i32 13,
	i32 57, i32 94, i32 38, i32 109, i32 102, i32 83, i32 121, i32 37,
	i32 79, i32 16, i32 151, i32 62, i32 43, i32 19, i32 77, i32 74,
	i32 38, i32 152, i32 92, i32 91, i32 80, i32 119, i32 16, i32 46,
	i32 37, i32 111, i32 145, i32 133, i32 152, i32 84, i32 71, i32 73,
	i32 89, i32 12, i32 94, i32 36, i32 50, i32 137, i32 124, i32 45,
	i32 5, i32 121, i32 144, i32 74, i32 163, i32 23, i32 157, i32 19,
	i32 160, i32 108, i32 130, i32 167, i32 134, i32 26, i32 156, i32 3,
	i32 65, i32 10, i32 0, i32 119, i32 50, i32 114, i32 26, i32 166,
	i32 48, i32 61, i32 101, i32 22, i32 15, i32 163, i32 106, i32 131,
	i32 145, i32 124, i32 125, i32 88, i32 64, i32 0, i32 110, i32 122,
	i32 62, i32 41, i32 15, i32 88, i32 108, i32 129, i32 78, i32 137,
	i32 135, i32 149, i32 40, i32 153, i32 160, i32 105, i32 35, i32 28,
	i32 20, i32 23, i32 34, i32 156, i32 98, i32 99, i32 32, i32 129,
	i32 85, i32 60, i32 136, i32 73, i32 47, i32 142, i32 64, i32 135,
	i32 49, i32 14, i32 45, i32 93, i32 85, i32 81, i32 43, i32 50,
	i32 86, i32 59, i32 44, i32 104, i32 30, i32 138, i32 30, i32 122,
	i32 39, i32 49, i32 147, i32 154, i32 32, i32 163, i32 11, i32 63,
	i32 67, i32 89, i32 150, i32 119, i32 143, i32 136, i32 130, i32 129,
	i32 13, i32 21, i32 12, i32 7, i32 146, i32 169, i32 81, i32 115,
	i32 61, i32 86, i32 131, i32 123, i32 79, i32 66, i32 56, i32 62,
	i32 59, i32 6, i32 126, i32 132, i32 54, i32 116, i32 90, i32 19,
	i32 91, i32 164, i32 138, i32 118, i32 132, i32 67, i32 4, i32 93,
	i32 133, i32 31, i32 58, i32 29, i32 140, i32 82, i32 160, i32 10,
	i32 51, i32 130, i32 0, i32 158, i32 151, i32 124, i32 145, i32 78,
	i32 71, i32 141, i32 153, i32 72, i32 35, i32 28
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

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

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
