{ config, pkgs, ... }:

{
  sops.secrets = {
    "searx/secret_key" = {};
    "litellm/gemini_api_key"    = {};
    "litellm/groq_api_key"      = {};
    "litellm/openrouter_api_key" = {};
    "litellm/cerebras_api_key"  = {};
    "litellm/mistral_api_key"   = {};
    "litellm/github_token"      = {};
    "litellm/litellm_master_key" = {};
  };


  sops.templates."litellm.env" = {
    content = ''
      GEMINI_API_KEY=${config.sops.placeholder."litellm/gemini_api_key"}
      GROQ_API_KEY=${config.sops.placeholder."litellm/groq_api_key"}
      OPENROUTER_API_KEY=${config.sops.placeholder."litellm/openrouter_api_key"}
      CEREBRAS_API_KEY=${config.sops.placeholder."litellm/cerebras_api_key"}
      MISTRAL_API_KEY=${config.sops.placeholder."litellm/mistral_api_key"}
      GITHUB_TOKEN=${config.sops.placeholder."litellm/github_token"}
      LITELLM_MASTER_KEY=${config.sops.placeholder."litellm/litellm_master_key"}
    '';
    owner = "litellm";
    group = "litellm";
  };

  users.users.litellm = {
    isSystemUser = true;
    group = "litellm";
  };
  users.groups.litellm = {};  

  services.litellm = {
    enable = true;
    port = 4000;
    host = "127.0.0.1";

    # Point to the sops-rendered env file
    environmentFile = config.sops.templates."litellm.env".path;

    settings = {
      model_list = [
        # ── GEMINI (Google AI Studio) ─────────────────────────────
        {
          model_name = "gemini-flash-2.5";
          litellm_params = {
            model = "gemini/gemini-2.5-flash";
            api_key = "os.environ/GEMINI_API_KEY";
            rpm = 10;
            tpm = 250000;
          };
        }
        {
          model_name = "gemini-flash-3";
          litellm_params = {
            model = "gemini/gemini-3-flash-preview";
            api_key = "os.environ/GEMINI_API_KEY";
            rpm = 5;
            tpm = 250000;
          };
        }
        {
          model_name = "gemini-flash-lite-3.1";
          litellm_params = {
            model = "gemini/gemini-3.1-flash-lite-preview";
            api_key = "os.environ/GEMINI_API_KEY";
            rpm = 15;
            tpm = 250000;
          };
        }
        {
          model_name = "gemini-flash-lite-2.5";
          litellm_params = {
            model = "gemini/gemini-2.5-flash-lite";
            api_key = "os.environ/GEMINI_API_KEY";
            rpm = 15;
            tpm = 250000;
          };
        }

        # ── GROQ ──────────────────────────────────────────────────
        {
          model_name = "groq-llama-3.1-8b";
          litellm_params = {
            model = "groq/llama-3.1-8b-instant";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 30;
            tpm = 6000;
          };
        }
        {
          model_name = "groq-llama-3.3-70b";
          litellm_params = {
            model = "groq/llama-3.3-70b-versatile";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 30;
            tpm = 12000;
          };
        }
        {
          model_name = "groq-llama-4-scout";
          litellm_params = {
            model = "groq/meta-llama/llama-4-scout-17b-16e-instruct";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 30;
            tpm = 30000;
          };
        }
        {
          model_name = "groq-kimi-k2";
          litellm_params = {
            model = "groq/moonshotai/kimi-k2-instruct";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 60;
            tpm = 10000;
          };
        }
        {
          model_name = "groq-qwen3-32b";
          litellm_params = {
            model = "groq/qwen/qwen3-32b";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 60;
            tpm = 6000;
          };
        }
        {
          model_name = "groq-gpt-oss-120b";
          litellm_params = {
            model = "groq/openai/gpt-oss-120b";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 30;
            tpm = 8000;
          };
        }
        {
          model_name = "groq-gpt-oss-20b";
          litellm_params = {
            model = "groq/openai/gpt-oss-20b";
            api_key = "os.environ/GROQ_API_KEY";
            rpm = 30;
            tpm = 8000;
          };
        }

        # ── CEREBRAS ──────────────────────────────────────────────
        {
          model_name = "cerebras-llama-3.1-8b";
          litellm_params = {
            model = "cerebras/llama3.1-8b";
            api_key = "os.environ/CEREBRAS_API_KEY";
            rpm = 30;
            tpm = 60000;
          };
        }
        {
          model_name = "cerebras-qwen3-235b";
          litellm_params = {
            model = "cerebras/qwen-3-235b-a22b-instruct-2507";
            api_key = "os.environ/CEREBRAS_API_KEY";
            rpm = 30;
            tpm = 60000;
          };
        }

        # ── MISTRAL ───────────────────────────────────────────────
        {
          model_name = "mistral-codestral";
          litellm_params = {
            model = "mistral/codestral-latest";
            api_key = "os.environ/MISTRAL_API_KEY";
            rpm = 2;
            tpm = 500000;
          };
        }
        {
          model_name = "mistral-small";
          litellm_params = {
            model = "mistral/mistral-small-latest";
            api_key = "os.environ/MISTRAL_API_KEY";
            rpm = 2;
            tpm = 500000;
          };
        }
        {
          model_name = "mistral-large";
          litellm_params = {
            model = "mistral/mistral-large-latest";
            api_key = "os.environ/MISTRAL_API_KEY";
            rpm = 2;
            tpm = 500000;
          };
        }
        {
          model_name = "mistral-nemo";
          litellm_params = {
            model = "mistral/open-mistral-nemo";
            api_key = "os.environ/MISTRAL_API_KEY";
            rpm = 2;
            tpm = 500000;
          };
        }

        # ── OPENROUTER ────────────────────────────────────────────
        {
          model_name = "openrouter-gpt-oss-120b";
          litellm_params = {
            model = "openrouter/openai/gpt-oss-120b:free";
            api_key = "os.environ/OPENROUTER_API_KEY";
            rpm = 20;
          };
        }
        {
          model_name = "openrouter-qwen3.6-plus";
          litellm_params = {
            model = "openrouter/qwen/qwen3.6-plus:free";
            api_key = "os.environ/OPENROUTER_API_KEY";
            rpm = 20;
          };
        }
        {
          model_name = "openrouter-nvidia-nemotron-super";
          litellm_params = {
            model = "openrouter/nvidia/nemotron-3-super-120b-a12b:free";
            api_key = "os.environ/OPENROUTER_API_KEY";
            rpm = 20;
          };
        }

        # ── GITHUB MODELS ─────────────────────────────────────────
        {
          # High tier
          model_name = "github-gpt-4.1";
          litellm_params = {
            model = "openai/gpt-4.1";
            api_key = "os.environ/GITHUB_TOKEN";
            api_base = "https://models.github.ai/inference";
            rpm = 10;
          };
        }
        {
          # High tier
          model_name = "github-deepseek-r1";
          litellm_params = {
            model = "openai/DeepSeek-R1";
            api_key = "os.environ/GITHUB_TOKEN";
            api_base = "https://models.github.ai/inference";
            rpm = 10;
          };
        }
        {
          # Low tier
          model_name = "github-llama-3.3-70b";
          litellm_params = {
            model = "openai/Meta-Llama-3.3-70B-Instruct";
            api_key = "os.environ/GITHUB_TOKEN";
            api_base = "https://models.github.ai/inference";
            rpm = 15;
          };
        }
        {
          # Low tier
          model_name = "github-phi-4";
          litellm_params = {
            model = "openai/Phi-4";
            api_key = "os.environ/GITHUB_TOKEN";
            api_base = "https://models.github.ai/inference";
            rpm = 15;
          };
        }

        # ── VIRTUAL MODELS ─────────────────────────────────────────
        {
          model_name = "fast-auto";
          litellm_params = {
            model = "groq-llama-3.1-8b";
          };
        }
        {
          model_name = "chat-auto";
          litellm_params = {
            model = "gemini-flash-lite-3.1";
          };
        }
        {
          model_name = "coding-auto";
          litellm_params = {
            model = "mistral-codestral";
          };
        }
        
      ];

      router_settings = {
        fallbacks = [
          # CODING CHAIN (strong → fallback → exhaust providers)
          { "mistral-codestral" = [
            "cerebras-qwen3-235b"
            "groq-qwen3-32b"
            "groq-gpt-oss-120b"
            "groq-kimi-k2"
            "gemini-flash-3"
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "cerebras-qwen3-235b" = [
            "groq-qwen3-32b"
            "groq-gpt-oss-120b"
            "groq-kimi-k2"
            "gemini-flash-3"
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "groq-qwen3-32b" = [
            "groq-gpt-oss-120b"
            "groq-kimi-k2"
            "gemini-flash-3"
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "groq-gpt-oss-120b" = [
            "groq-kimi-k2"
            "gemini-flash-3"
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "groq-kimi-k2" = [
            "gemini-flash-3"
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "gemini-flash-3" = [
            "gemini-flash-2.5"
            "openrouter-gpt-oss-120b"
          ]; }
          
          { "gemini-flash-2.5" = [
            "openrouter-gpt-oss-120b"
          ]; }

          # GENERAL CHAT
          { "gemini-flash-lite-3.1" = [
            "gemini-flash-lite-2.5"
            "groq-llama-3.3-70b"
            "groq-llama-4-scout"
            "groq-kimi-k2"
            "cerebras-llama-3.1-8b"
            "openrouter-nvidia-nemotron-super"
          ]; }
          
          { "gemini-flash-lite-2.5" = [
            "groq-llama-3.3-70b"
            "groq-llama-4-scout"
            "groq-kimi-k2"
            "cerebras-llama-3.1-8b"
            "openrouter-nvidia-nemotron-super"
          ]; }
          
          { "groq-llama-3.3-70b" = [
            "groq-llama-4-scout"
            "groq-kimi-k2"
            "cerebras-llama-3.1-8b"
            "openrouter-nvidia-nemotron-super"
          ]; }
          
          { "groq-llama-4-scout" = [
            "groq-kimi-k2"
            "cerebras-llama-3.1-8b"
            "openrouter-nvidia-nemotron-super"
          ]; }
          
          { "groq-kimi-k2" = [
            "cerebras-llama-3.1-8b"
            "openrouter-nvidia-nemotron-super"
          ]; }
          
          { "cerebras-llama-3.1-8b" = [
            "openrouter-nvidia-nemotron-super"
          ]; }

        ];
        num_retries = 0;
        allowed_fails = 0;
        cooldown_time = 86400;
        retry_policy = {
          RateLimitErrorRetries = 0;
          ServiceUnavailableErrorRetries = 0;
        };
        optional_pre_call_checks = [ "enforce_model_rate_limits" ];
      };

      general_settings = {
        master_key = "os.environ/LITELLM_MASTER_KEY";
      };

      litellm_settings = {
        drop_params = true;
        set_verbose = true;
        num_retries = 2;
      };
    };
  };

  services.ollama = {
    enable = true;
    host = "0.0.0.0";
    package = pkgs.ollama-cuda;
    loadModels = [
      "qwen3.5:9b"
      "deepseek-r1:8b"
    ];
  };

  sops.templates."openwebui.env" = {
    content = ''
      OPENAI_API_KEY=${config.sops.placeholder."litellm/litellm_master_key"}
    '';
    owner = "open-webui";  # or whatever user runs the service
    group = "open-webui";  # or whatever user runs the service
  };

  users.users.open-webui = {
    isSystemUser = true;
    group = "open-webui";
  };
  users.groups.open-webui = {};

  services.open-webui = {
    enable = true;
    port = 8080;
    host = "0.0.0.0";
    environmentFile = config.sops.templates."openwebui.env".path;
    environment = {
      ENABLE_OLLAMA_API = "false";
      OPENAI_API_BASE_URL = "http://127.0.0.1:4000/v1";
      WEBUI_NAME = "My AI";
      ENABLE_SIGNUP = "false";
      #DEFAULT_MODELS = "groq-llama,gemini-pro";
      ANONYMIZED_TELEMETRY = "False";
      DO_NOT_TRACK = "True";
    };
  };

  sops.templates."searx.env" = {
    content = ''
      SEARXNG_SECRET=${config.sops.placeholder."searx/secret_key"}
    '';
    owner = "searx";
    group = "searx";
  };

  users.users.searx = {
    isSystemUser = true;
    group = "searx";
  };
  users.groups.searx = {};

  services.searx = {
    enable = true;
    package = pkgs.searxng;
    redisCreateLocally = true;
    environmentFile = config.sops.templates."searx.env".path;
    settings = {
      general.debug = false;

      server = {
        bind_address = "192.168.44.10";
        port = 8888;
        limiter = false;
        method = "GET";
      };

      search.formats = [ "html" "json" ];
    };
  };
}
