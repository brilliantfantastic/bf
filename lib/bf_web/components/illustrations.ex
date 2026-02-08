defmodule BrilliantFantasticWeb.Components.Illustrations do
  @moduledoc """
  SVG illustration components for the fantastic theme background.

  Each function renders a single decorative SVG with hand-drawn,
  bold linework in a minimalist, darkly whimsical style.
  """
  use Phoenix.Component

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def sad_cactus(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <line x1="50" y1="90" x2="50" y2="35" />
      <line x1="50" y1="55" x2="35" y2="55" />
      <line x1="35" y1="55" x2="35" y2="42" />
      <line x1="50" y1="48" x2="65" y2="48" />
      <line x1="65" y1="48" x2="65" y2="35" />
      <ellipse cx="50" cy="33" rx="4" ry="5" fill="currentColor" stroke="none" />
      <ellipse cx="35" cy="40" rx="3" ry="4" fill="currentColor" stroke="none" />
      <ellipse cx="65" cy="33" rx="3" ry="4" fill="currentColor" stroke="none" />
      <circle cx="46" cy="50" r="1.2" fill="currentColor" stroke="none" />
      <circle cx="54" cy="50" r="1.2" fill="currentColor" stroke="none" />
      <path d="M46 57 Q50 54 54 57" />
      <line x1="15" y1="90" x2="85" y2="90" />
      <circle cx="25" cy="20" r="1" fill="currentColor" stroke="none" />
      <circle cx="78" cy="15" r="0.8" fill="currentColor" stroke="none" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def ufo_beaming_cat(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <ellipse cx="50" cy="30" rx="25" ry="8" />
      <path d="M35 30 Q40 18 50 16 Q60 18 65 30" />
      <circle cx="50" cy="22" r="4" />
      <line x1="40" y1="38" x2="35" y2="70" />
      <line x1="60" y1="38" x2="65" y2="70" />
      <line x1="50" y1="38" x2="50" y2="70" stroke-dasharray="3 3" />
      <ellipse cx="50" cy="78" rx="6" ry="8" />
      <path d="M44 72 L46 66 L48 72" />
      <path d="M52 72 L54 66 L56 72" />
      <circle cx="48" cy="76" r="1" fill="currentColor" stroke="none" />
      <circle cx="52" cy="76" r="1" fill="currentColor" stroke="none" />
      <path d="M56 82 Q62 80 64 75" />
      <line x1="20" y1="90" x2="80" y2="90" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def skull_flower(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M35 65 Q30 65 28 55 Q26 42 35 35 Q42 28 50 28 Q58 28 65 35 Q74 42 72 55 Q70 65 65 65" />
      <path d="M37 65 Q40 72 50 72 Q60 72 63 65" />
      <line x1="43" y1="65" x2="43" y2="72" />
      <line x1="50" y1="65" x2="50" y2="72" />
      <line x1="57" y1="65" x2="57" y2="72" />
      <circle cx="42" cy="48" r="5" />
      <circle cx="58" cy="48" r="5" />
      <path d="M48 56 L50 59 L52 56" />
      <line x1="50" y1="28" x2="50" y2="10" />
      <line x1="50" y1="20" x2="44" y2="22" />
      <line x1="50" y1="16" x2="56" y2="18" />
      <circle cx="50" cy="8" r="3" fill="currentColor" stroke="none" />
      <circle cx="47" cy="5" r="2.5" />
      <circle cx="53" cy="5" r="2.5" />
      <circle cx="47" cy="10" r="2.5" />
      <circle cx="53" cy="10" r="2.5" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def cool_ghost(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M30 85 L30 45 Q30 20 50 20 Q70 20 70 45 L70 85 Q65 78 60 85 Q55 78 50 85 Q45 78 40 85 Q35 78 30 85 Z" />
      <rect x="34" y="42" width="12" height="8" rx="2" fill="currentColor" stroke="none" />
      <rect x="54" y="42" width="12" height="8" rx="2" fill="currentColor" stroke="none" />
      <line x1="46" y1="46" x2="54" y2="46" />
      <circle cx="50" cy="60" r="3" />
      <line x1="34" y1="55" x2="37" y2="55" />
      <line x1="63" y1="55" x2="66" y2="55" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def palm_and_moon(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M50 90 Q48 70 52 50 Q50 45 50 40" />
      <path d="M50 40 Q35 30 20 35" />
      <path d="M50 40 Q38 25 28 22" />
      <path d="M50 40 Q60 25 72 22" />
      <path d="M50 40 Q65 30 80 35" />
      <path d="M50 40 Q50 22 48 18" />
      <circle cx="48" cy="42" r="2.5" fill="currentColor" stroke="none" />
      <circle cx="53" cy="43" r="2.5" fill="currentColor" stroke="none" />
      <path
        d="M75 15 Q82 20 82 30 Q82 40 75 45 Q80 38 80 30 Q80 22 75 15"
        fill="currentColor"
        stroke="none"
      />
      <circle cx="20" cy="15" r="1" fill="currentColor" stroke="none" />
      <circle cx="30" cy="10" r="0.7" fill="currentColor" stroke="none" />
      <path d="M25 90 Q50 86 75 90" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def alien_head(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M30 55 Q28 30 40 20 Q48 15 50 15 Q52 15 60 20 Q72 30 70 55 Q65 70 50 72 Q35 70 30 55 Z" />
      <path d="M36 42 Q42 34 50 42 Q42 46 36 42 Z" fill="currentColor" stroke="none" />
      <path d="M50 42 Q58 34 64 42 Q58 46 50 42 Z" fill="currentColor" stroke="none" />
      <circle cx="48" cy="54" r="1" fill="currentColor" stroke="none" />
      <circle cx="52" cy="54" r="1" fill="currentColor" stroke="none" />
      <line x1="45" y1="60" x2="55" y2="60" />
      <line x1="42" y1="16" x2="38" y2="8" />
      <circle cx="38" cy="7" r="1.5" fill="currentColor" stroke="none" />
      <line x1="58" y1="16" x2="62" y2="8" />
      <circle cx="62" cy="7" r="1.5" fill="currentColor" stroke="none" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def snake_and_dagger(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M50 15 L55 55 L50 60 L45 55 Z" />
      <line x1="50" y1="60" x2="50" y2="78" />
      <rect x="42" y="58" width="16" height="4" rx="1" />
      <circle cx="50" cy="80" r="4" />
      <path d="M62 25 Q68 30 62 38 Q50 42 38 38 Q30 34 35 44 Q38 52 50 50 Q62 48 66 55 Q68 62 58 65" />
      <circle cx="58" cy="66" r="3" />
      <circle cx="57" cy="65" r="0.8" fill="currentColor" stroke="none" />
      <path d="M60 68 L64 70 M60 68 L63 72" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def cute_reaper(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M28 55 Q25 25 50 18 Q75 25 72 55" />
      <path d="M35 52 Q35 38 50 32 Q65 38 65 52" />
      <circle cx="44" cy="44" r="2" fill="currentColor" stroke="none" />
      <circle cx="56" cy="44" r="2" fill="currentColor" stroke="none" />
      <path d="M44 50 Q50 53 56 50" />
      <path d="M28 55 Q26 75 30 90 L70 90 Q74 75 72 55" />
      <line x1="72" y1="30" x2="82" y2="85" />
      <path d="M72 30 Q65 18 55 22 Q60 28 72 30" fill="currentColor" stroke="none" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def cosmic_eye(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M10 50 Q30 25 50 25 Q70 25 90 50 Q70 75 50 75 Q30 75 10 50 Z" />
      <circle cx="50" cy="50" r="15" />
      <circle cx="50" cy="50" r="7" fill="currentColor" stroke="none" />
      <ellipse cx="50" cy="50" rx="14" ry="4" />
      <line x1="30" y1="32" x2="28" y2="24" />
      <line x1="40" y1="27" x2="39" y2="19" />
      <line x1="50" y1="25" x2="50" y2="17" />
      <line x1="60" y1="27" x2="61" y2="19" />
      <line x1="70" y1="32" x2="72" y2="24" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def melting_face(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <circle cx="50" cy="42" r="25" />
      <line x1="40" y1="36" x2="46" y2="42" />
      <line x1="46" y1="36" x2="40" y2="42" />
      <line x1="54" y1="36" x2="60" y2="42" />
      <line x1="60" y1="36" x2="54" y2="42" />
      <path d="M38 50 Q44 58 50 50 Q56 58 62 50" />
      <path d="M30 60 Q28 75 32 88" />
      <path d="M42 65 Q40 80 43 92" />
      <path d="M55 66 Q56 82 54 90" />
      <path d="M67 62 Q70 78 66 88" />
      <path d="M50 67 Q50 85 50 95" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def floating_helmet(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <circle cx="50" cy="45" r="25" />
      <path d="M32 40 Q35 28 50 26 Q65 28 68 40 Q65 52 50 54 Q35 52 32 40 Z" />
      <path d="M38 36 Q42 32 48 34" />
      <rect x="38" y="68" width="24" height="6" rx="2" />
      <path d="M50 74 Q48 82 52 90" />
      <circle cx="15" cy="20" r="1" fill="currentColor" stroke="none" />
      <circle cx="82" cy="15" r="1.2" fill="currentColor" stroke="none" />
      <circle cx="88" cy="60" r="0.8" fill="currentColor" stroke="none" />
      <circle cx="12" cy="70" r="0.8" fill="currentColor" stroke="none" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def all_seeing_hand(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M30 40 L30 15 Q30 10 34 10 Q38 10 38 15 L38 35" />
      <path d="M38 35 L38 10 Q38 5 42 5 Q46 5 46 10 L46 32" />
      <path d="M46 32 L46 8 Q46 3 50 3 Q54 3 54 8 L54 32" />
      <path d="M54 32 L54 12 Q54 7 58 7 Q62 7 62 12 L62 38" />
      <path d="M30 40 Q22 42 20 50 Q22 55 28 55" />
      <path d="M28 55 Q28 75 35 80 Q45 86 55 80 Q62 75 62 55 L62 38" />
      <path d="M36 58 Q45 50 54 58 Q45 66 36 58 Z" />
      <circle cx="45" cy="58" r="4" fill="currentColor" stroke="none" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def broken_heart(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M50 85 Q15 60 15 38 Q15 22 30 22 Q42 22 50 35 Q58 22 70 22 Q85 22 85 38 Q85 60 50 85 Z" />
      <path d="M50 30 L45 48 L55 52 L48 72" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def mushroom(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 100 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M20 50 Q20 18 50 18 Q80 18 80 50 Z" />
      <circle cx="38" cy="35" r="5" fill="currentColor" stroke="none" />
      <circle cx="55" cy="28" r="4" fill="currentColor" stroke="none" />
      <circle cx="62" cy="42" r="3.5" fill="currentColor" stroke="none" />
      <circle cx="42" cy="46" r="3" fill="currentColor" stroke="none" />
      <rect x="42" y="50" width="16" height="28" rx="4" />
      <circle cx="43" cy="38" r="1" fill="currentColor" stroke="none" />
      <circle cx="52" cy="38" r="1" fill="currentColor" stroke="none" />
      <path d="M46 44 Q50 47 54 44" />
      <line x1="30" y1="82" x2="70" y2="82" />
    </svg>
    """
  end

  attr :class, :string, default: ""
  attr :style, :string, default: ""

  def coffin_flower(assigns) do
    ~H"""
    <svg
      class={@class}
      style={@style}
      viewBox="0 0 60 100"
      fill="none"
      stroke="currentColor"
      stroke-width="2.5"
      stroke-linecap="round"
      stroke-linejoin="round"
      xmlns="http://www.w3.org/2000/svg"
    >
      <path d="M20 10 L40 10 L48 30 L48 80 L38 95 L22 95 L12 80 L12 30 Z" />
      <line x1="20" y1="10" x2="20" y2="95" opacity="0.3" />
      <line x1="12" y1="52" x2="48" y2="52" opacity="0.3" />
      <line x1="30" y1="52" x2="30" y2="35" />
      <line x1="30" y1="42" x2="25" y2="44" />
      <line x1="30" y1="38" x2="35" y2="40" />
      <circle cx="30" cy="33" r="3" fill="currentColor" stroke="none" />
      <circle cx="27" cy="31" r="2" />
      <circle cx="33" cy="31" r="2" />
      <circle cx="30" cy="36" r="2" />
    </svg>
    """
  end
end
